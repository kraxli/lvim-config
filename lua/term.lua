
-- credit: https://github.com/hkupty/iron.nvim

core.send_line = function()
  local ft = ll.get_buffer_ft(0)

  if ft ~= nil then

    local linenr = vim.api.nvim_win_get_cursor(0)[1] - 1
    local cur_line = vim.api.nvim_buf_get_lines(0, linenr, linenr + 1, 0)[1]
    local width = vim.fn.strwidth(cur_line)

    if width == 0 then return end

    marks.set{
      from_line = linenr,
      from_col = 0,
      to_line = linenr,
      to_col = width
    }

    core.send(ft, cur_line)
  end
end


core.send_chunk = function(mode, mtype)
  local bstart, bend
  local ft = ll.get_buffer_ft(0)

  if ft == nil then return end

  if mode == "visual" then
    bstart = "'<"
    bend = "'>"
  else
    bstart = "'["
    bend = "']"
  end

  local b_line, b_col = unpack(vim.fn.getpos(bstart),2,3)
  local e_line, e_col = unpack(vim.fn.getpos(bend),2,3)

  local lines = vim.api.nvim_buf_get_lines(0, b_line - 1, e_line, 0)

  if #lines == 0 then return end

  local b_line_len = vim.fn.strwidth(lines[1])
  local e_line_len = vim.fn.strwidth(lines[#lines])

  b_col, e_col = unpack(mtype=='line' and { 0, e_line_len } or { b_col, e_col })

  --handle eol
  b_col = ( b_col > b_line_len ) and b_line_len or b_col
  e_col = ( e_col > e_line_len ) and e_line_len or e_col

  if e_col > 1 then
    lines[#lines] = string.sub(lines[#lines], 1, e_col)
  end
  if b_col > 1 then
    lines[1] = string.sub(lines[1], b_col)
  end

  core.send(ft, lines)

  marks.set{
    from_line = b_line - 1,
    from_col = math.max(b_col - 1, 0),
    to_line = e_line - 1,
    to_col = e_col
  }

  marks.winrestview()
end

core.visual_send = function() core.send_chunk("visual") end

-- map <silent> <Plug>(iron-send-line)     :lua require("iron").core.send_line()<CR>
-- map <silent> <Plug>(iron-visual-send)   :lua require("iron").core.visual_send()<CR>

