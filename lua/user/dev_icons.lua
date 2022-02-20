local M = {}

M.set_icon = function()
  require("nvim-web-devicons").set_icon {
    rs = {
      icon = "",
      color = "#d28445",
      name = "Rust",
    },
    tf = {
      icon = "ﲽ",
      color = "#3d59a1",
      name = "Terraform",
    },
    tfvars = {
      icon = "ﲽ",
      color = "#51afef",
      name = "Terraform",
    },
    mod = {
      icon = "ﳑ",
      color = "#6a9fb5",
      name = "Mod",
    },
    sum = {
      icon = "",
      color = "#6a9fb5",
      name = "Sum",
    },
    txt = {
      icon = "",
      color = "#bbc2cf",
      name = "Text",
    },
    csv = {
      icon = "",
      color = "#31B53E",
      name = "CSV",
    },
    plist = {
      icon = "",
      color = "#8FAA54",
      name = "Plist",
    },
    burp = {
      icon = "",
      color = "#F16529",
      name = "Burp",
    },
    mp4 = {
      icon = "",
      color = "#5fd7ff",
      name = "MP4",
    },
    mkv = {
      icon = "",
      color = "#5fd7ff",
      name = "MKV",
    },
    hcl = {
      icon = "",
      color = "#689FB6",
      name = "HCL",
    },
    override = {
        ["yarn.lock"] = {
            icon = "",
            color = "#cc3534",
            name = "YarnLock",
        },
        ["package.json"] = {
            icon = "",
            color = "#cc3534",
            name = "PackageJson",
        },
        [".npmrc"] = {
            icon = "",
            color = "#cc3534",
            name = "PackageJson",
        },
        [".env"] = {
            icon = "﬛",
            color = "#e79627",
            name = "Env",
        },
        [".env.example"] = {
            icon = "﬛",
            color = "#e79627",
            name = "EnvExample",
        },
        [".env.local"] = {
            icon = "﬛",
            color = "#e79627",
            name = "EnvLocal",
        },
        [".babelrc"] = {
            icon = "",
            color = "#e79627",
            name = "EnvLocal",
        },
        ["js"] = {
            icon = "",
            color = "#ffcb6b",
            name = "Js",
        },
        ["ts"] = {
            icon = "ﯤ",
            color = "#497eb9",
            name = "Ts",
        },
        ["jsx"] = {
            icon = "",
            color = "#61d9fa",
            name = "Jsx",
        },
        ["tsx"] = {
            icon = "",
            color = "#61d9fa",
            name = "Tsx",
        },
        ["index.ts"] = {
            icon = "",
            color = "#a5afbe",
            name = "IndexTs",
        },
        [".eslintrc.json"] = {
            icon = "難",
            color = "#7963e6",
            name = "EslintRc",
        },
        [".gitignore"] = {
            icon = "",
            color = "#e94e31",
            name = "GitIgnore",
        },
        [".gitattributes"] = {
            icon = "",
            color = "#e94e31",
            name = "GitIgnore",
        },
        ["lua"] = {
            icon = "",
            color = "#9575cd",
            name = "Lua",
        },
        ["Dockerfile"] = {
            icon = "",
            color = "#1e9cef",
            name = "Docker",
        },
        [".dockerignore"] = {
            icon = "",
            color = "#1e9cef",
            name = "Docker",
        },
        [".yml"] = {
            icon = "",
            color = "#ffca28",
            name = "Yml",
        },
        [".yaml"] = {
            icon = "",
            color = "#ffca28",
            name = "Yaml",
        },
        ["schema.graphql"] = {
            icon = "爵",
            color = "#7963e6",
            name = "Graphql",
        },
        ["bitbucket-pipelines.yml"] = {
            icon = "",
            color = "#267ff6",
            name = "BitbucketPipeline",
        },
        [".nvmrc"] = {
            icon = "",
            color = "#72b823",
            name = "Nvmrc",
        },
    },

  }
end

return M
