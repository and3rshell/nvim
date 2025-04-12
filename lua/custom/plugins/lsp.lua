return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "stevearc/conform.nvim",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      local extend = function(name, key, values)
        local mod = require(string.format("lspconfig.configs.%s", name))
        local default = mod.default_config
        local keys = vim.split(key, ".", { plain = true })
        while #keys > 0 do
          local item = table.remove(keys, 1)
          default = default[item]
        end

        if vim.islist(default) then
          for _, value in ipairs(default) do
            table.insert(values, value)
          end
        else
          for item, value in pairs(default) do
            if not vim.tbl_contains(values, item) then
              values[item] = value
            end
          end
        end
        return values
      end

      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local lspconfig = require("lspconfig")

      local servers = {
        bashls = true,
        lua_ls = {
          server_capabilities = {
            semanticTokensProvider = vim.NIL,
          },
          settings = {
            Lua = {
              diagnostics = {
                globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
              },
            },
          },
        },
        intelephense = {
          init_options = {
            globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
          },
          files = {
            maxSize = 5000000,
          },
          telemetry_enabled = false,
          stubs = {
            "apache",
            "bcmath",
            "bz2",
            "calendar",
            "com_dotnet",
            "Core",
            "ctype",
            "curl",
            "date",
            "dba",
            "dom",
            "enchant",
            "exif",
            "FFI",
            "fileinfo",
            "filter",
            "fpm",
            "ftp",
            "gd",
            "gettext",
            "gmp",
            "hash",
            "iconv",
            "imap",
            "intl",
            "json",
            "ldap",
            "libxml",
            "mbstring",
            "meta",
            "mysqli",
            "oci8",
            "odbc",
            "openssl",
            "pcntl",
            "pcre",
            "PDO",
            "pdo_ibm",
            "pdo_mysql",
            "pdo_pgsql",
            "pdo_sqlite",
            "pgsql",
            "Phar",
            "posix",
            "pspell",
            "random",
            "readline",
            "Reflection",
            "session",
            "shmop",
            "SimpleXML",
            "snmp",
            "soap",
            "sockets",
            "sodium",
            "SPL",
            "sqlite3",
            "standard",
            "superglobals",
            "sysvmsg",
            "sysvsem",
            "sysvshm",
            "tidy",
            "tokenizer",
            "xml",
            "xmlreader",
            "xmlrpc",
            "xmlwriter",
            "xsl",
            "Zend OPcache",
            "zip",
            "zlib",
            "redis",
          },
        },

        pyright = true,

        -- Enabled biome formatting, turn off all the other ones generally
        biome = true,
        vtsls = {
          server_capabilities = {
            documentFormattingProvider = false,
          },
        },
        jsonls = {
          server_capabilities = {
            documentFormattingProvider = false,
          },
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },

        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              -- schemas = require("schemastore").yaml.schemas(),
            },
          },
        },

        clangd = {
          -- cmd = { "clangd", unpack(require("custom.clangd").flags) },
          -- TODO: Could include cmd, but not sure those were all relevant flags.
          --    looks like something i would have added while i was floundering
          init_options = { clangdFileStatus = true },

          filetypes = { "c" },
        },

        tailwindcss = {
          filetypes = extend("tailwindcss", "filetypes", { "vue" }),
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  [[class: "([^"]*)]],
                  [[className="([^"]*)]],
                },
              },
              -- includeLanguages = extend("tailwindcss", "settings.tailwindCSS.includeLanguages", {
              -- 	["ocaml.mlx"] = "html",
              -- }),
            },
          },
        },
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      require("mason").setup()
      local ensure_installed = {
        "stylua",
        "lua_ls",
        "delve",
        "intelephense",
        "pyright",
        "bashls",
      }

      vim.list_extend(ensure_installed, servers_to_install)
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      local disable_semantic_tokens = {
        lua = true,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          local settings = servers[client.name]
          if type(settings) ~= "table" then
            settings = {}
          end

          local builtin = require("telescope.builtin")

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
          -- vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
          vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
          vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

          -- vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
          vim.keymap.set("n", "<space>c", vim.lsp.buf.code_action, { buffer = 0 })
          -- vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })

          vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
          vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
          vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

          local filetype = vim.bo[bufnr].filetype
          if disable_semantic_tokens[filetype] then
            client.server_capabilities.semanticTokensProvider = nil
          end

          -- Override server capabilities
          if settings.server_capabilities then
            for k, v in pairs(settings.server_capabilities) do
              if v == vim.NIL then
                ---@diagnostic disable-next-line: cast-local-type
                v = nil
              end

              client.server_capabilities[k] = v
            end
          end
        end,
      })

      vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = false, -- if false, diagnostics are updated on InsertLeave
        underline = false,
        severity_sort = false,
        float = {
          focusable = false,
          style = "default",
          border = "rounded",
          source = "if_many",
          header = "Diagnostics",
          prefix = "• ",
        },
      })

      -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      --     vim.lsp.handlers.hover, {
      --         border = "rounded",
      --         max_height = 25,
      --         max_width = 100,
      --         focusable = true,
      --         silent = true
      --         -- title = "",
      --     }
      -- )
      --
      -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      --     vim.lsp.handlers.signature_help, {
      --         border = "rounded",
      --     }
      -- )

      require("custom.autoformat").setup()
    end,
  },
}
