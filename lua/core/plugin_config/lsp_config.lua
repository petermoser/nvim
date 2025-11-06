-- Setup mason and mason-lspconfig
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"cssls",
		"lua_ls",
		"rust_analyzer",
		"ts_ls",
		"jsonls",
		"docker_compose_language_service",
		"dockerls",
		"pyright",
		"ruff_lsp", -- Python linting and formatting
		"tailwindcss",
		"yamlls",
	},
	automatic_enable = true,
})

-- Configure diagnostics to show in the buffer
vim.diagnostic.config({
	virtual_text = true, -- Show diagnostics as virtual text
	signs = true, -- Show signs in the sign column
	underline = true, -- Underline text with issues
	update_in_insert = false, -- Don't update diagnostics in insert mode
	severity_sort = true, -- Sort diagnostics by severity
	float = {
		border = "rounded", -- Add border to floating windows
		header = "", -- No header in floating windows
		prefix = "", -- No prefix in floating windows
	},
})

-- Define a function to attach completion and keymaps
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

	-- Buffer local mappings.
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Key mappings
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
end

-- Define default capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Loop through the servers and set them up using new API
local servers = {
	"html",
	"cssls",
	"rust_analyzer",
	"ts_ls",
	"jsonls",
	"docker_compose_language_service",
	"dockerls",
	"pyright",
	"tailwindcss",
}

for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Configure ruff_lsp for Python linting
vim.lsp.config("ruff_lsp", {
	on_attach = function(client, bufnr)
		-- Disable hover in favor of Pyright
		client.server_capabilities.hoverProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	init_options = {
		settings = {
			-- Additional ruff settings can be added here
			args = {},
		},
	},
})

-- Special configuration for lua_ls
vim.lsp.config("lua_ls", {
	-- Server-specific settings. See `:help lsp-quickstart`
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- Configure the 'yamlls' server
vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "*.yml",
			},
			customTags = {
				"!And",
				"!And sequence",
				"!If",
				"!If sequence",
				"!Not",
				"!Not sequence",
				"!Equals",
				"!Equals sequence",
				"!Or",
				"!Or sequence",
				"!FindInMap",
				"!FindInMap sequence",
				"!Base64",
				"!Cidr",
				"!Ref",
				"!Ref scalar",
				"!Sub",
				"!Sub sequence",
				"!GetAtt",
				"!GetAtt sequence",
				"!GetAZs",
				"!ImportValue",
				"!ImportValue sequence",
				"!Select",
				"!Select sequence",
				"!Split",
				"!Split sequence",
				"!Join",
				"!Join sequence",
			},
		},
	},
})
-- Optional: Configure diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
