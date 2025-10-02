return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"pyright", -- Python
					"jedi_language_server", -- Python
					"clangd", -- C and C++
					"rust_analyzer", -- Rust (added)
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Auto-formatting setup
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local function setup_format_on_save(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end

			-- Lua
			vim.lsp.config.lua_ls = {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = {
					".luarc.json",
					".luarc.jsonc",
					".luacheckrc",
					".stylua.toml",
					"stylua.toml",
					"selene.toml",
					"selene.yml",
					".git",
				},
				on_attach = function(client, bufnr)
					setup_format_on_save(client, bufnr)
				end,
			}

			-- Python - Pyright
			vim.lsp.config.pyright = {
				cmd = { "pyright-langserver", "--stdio" },
				filetypes = { "python" },
				root_markers = {
					"pyproject.toml",
					"setup.py",
					"setup.cfg",
					"requirements.txt",
					"Pipfile",
					"pyrightconfig.json",
					".git",
				},
			}

			-- Python - Jedi
			vim.lsp.config.jedi_language_server = {
				cmd = { "jedi-language-server" },
				filetypes = { "python" },
				root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
				on_attach = function(client, bufnr)
					setup_format_on_save(client, bufnr)
				end,
			}

			-- C/C++
			vim.lsp.config.clangd = {
				cmd = {
					"clangd",
					"--background-index",
					"--suggest-missing-includes",
					"--header-insertion=iwyu",
					"--query-driver=/Library/Developer/CommandLineTools/usr/bin/cc*,/usr/local/bin/mpic*,/opt/homebrew/bin/mpic*",
				},
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
				root_markers = {
					".clangd",
					".clang-tidy",
					".clang-format",
					"compile_commands.json",
					"compile_flags.txt",
					"configure.ac",
					".git",
				},
				on_attach = function(client, bufnr)
					setup_format_on_save(client, bufnr)
				end,
			}

			-- Rust
			vim.lsp.config.rust_analyzer = {
				cmd = { "rust-analyzer" },
				filetypes = { "rust" },
				root_markers = { "Cargo.toml", "rust-project.json" },
				on_attach = function(client, bufnr)
					setup_format_on_save(client, bufnr)
				end,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
						inlayHints = {
							parameterHints = true,
							typeHints = true,
						},
					},
				},
			}

			-- Enable all configured servers (removed texlab since it's not configured)
			vim.lsp.enable({ "lua_ls", "pyright", "jedi_language_server", "clangd", "rust_analyzer" })

			-- Keymaps
			vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Show LSP definition" })
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Show LSP code action" })
			vim.keymap.set("n", "<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "Format buffer using LSP" })
		end,
	},
}
