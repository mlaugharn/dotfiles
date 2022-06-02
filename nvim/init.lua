vim.g.python_host_prog = '/Users/marc/.pyenv/versions/3.10.0/envs/nvim_venv/bin/python'
vim.o.termguicolors = true
vim.o.number = true
vim.o.showtabline = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.autoindent = true
vim.o.ruler = true
vim.o.showcmd = true
vim.o.incsearch = true
vim.o.so = 7
vim.o.cmdheight=2
vim.o.selectmode='mouse'
vim.o.mouse='a'
vim.wo.foldcolumn='1'
vim.o.lazyredraw=true
vim.o.showmatch=true
vim.o.mat=2
vim.o.wildmenu=true
vim.o.ai=true
vim.o.si=true
vim.o.expandtab=true
vim.o.smarttab=true
vim.o.shiftwidth=4
vim.o.tabstop=4
vim.o.lbr=true
vim.o.wrap=true
vim.o.background=dark
vim.o.encoding='utf8'
vim.o.laststatus=2

-- some inspiration from https://bryankegley.me/posts/nvim-getting-started/ (marc @ 2022-06-2)

-- space as leader key
vim.g.mapleader = ' '  

-- key_mapper function
local key_mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        {noremap = true, silent = true}
    )
end

-- disable arrow keys to force hjkl muscle memory
key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')

-- also, use the keycombo 'jk' as an alias for '<ESC>'
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'JK', '<ESC>')
key_mapper('i', 'jK', '<ESC>')
key_mapper('v', 'jk', '<ESC>')
key_mapper('v', 'JK', '<ESC>')
key_mapper('v', 'jK', '<ESC>')


-- ensure packer is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    -- add plugins here:
    
    use 'neovim/nvim-lspconfig'             -- language-server
    use 'nvim-treesitter/nvim-treesitter'   -- ast parsing
    use 'sheerun/vim-polyglot'              -- language pack
    use 'nvim-lua/completion-nvim'
    use 'anott03/nvim-lspinstall'
    -- fuzzy finding
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/telescope.nvim'
    use 'jremmen/vim-ripgrep'
    -- motd enhancement
    use 'liuchengxu/vim-clap'
    use 'glepnir/dashboard-nvim'
    -- refactoring tools
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }

    -- themes
    use 'tjdevries/colorbuddy.nvim'
    use 'bkegley/gloombuddy'

    -- formatting
    use {'prettier/vim-prettier', run='yarn install'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)



-- packer config
local execute = vim.api.nvim_command
vim.cmd('packadd packer.nvim')

-- theme
vim.g.colors_name = 'gloombuddy'


-- tresitter config
local configs = require'nvim-treesitter.configs'
configs.setup {
--    ensure_installed = "maintained",
    highlight = {
        enable = true
    }
}

-- lsp config
local lspconfig = require'lspconfig'
local completion = require'completion'

local function custom_on_attach(client)
    print('Attaching to ' .. client.name)
    completion.on_attach(client)
end

local default_config = {
    on_attach = custom_on_attach
}

-- setup lang servers
lspconfig.tsserver.setup(default_config)

-- less obtrusive diagnostic errors
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

-- lsp key mappings
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

-- fuzzy find key mappings
key_mapper('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')


-- refactoring config
require('refactoring').setup({
    -- prompt for return type
    prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
    },
})

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

