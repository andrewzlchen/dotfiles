--- ensure that packer is installed on any machine this config is installed on
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

execute 'packadd packer.nvim'

function declare_deps()
    return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use 'tpope/vim-dispatch'

        --- Appearance
        use 'kyazdani42/nvim-web-devicons'                      --- Dev Icons
        use 'itchyny/lightline.vim'                             --- Bottom status bar
        use 'rafi/awesome-vim-colorschemes'                     --- Color themes
        use 'luochen1990/rainbow'                               --- Rainbow parentheses
        use 'junegunn/goyo.vim'                                 --- Zen mode
        use 'Yggdroot/indentLine'                               --- Lines for showing tabs
        use 'szw/vim-maximizer'                                 --- toggle maximizing buffers
        use 'gko/vim-coloresque'                                --- Colors in Vim #f00 #0f0 #00f
        use 'tpope/vim-unimpaired'                              --- pair keymaps

        --- Quality of Life Improvements
        use 'tpope/vim-commentary'                              --- Comments
        use 'terryma/vim-multiple-cursors'                      --- sublime text-like multi cursors
        use 'tpope/vim-surround'                                --- quick edits of surrounding quotes/markup/brackets
        use 'airblade/vim-rooter'                               --- set cwd to project root
        -- use 'guns/vim-sexp'                                     --- adds text motions for working with lisps
        -- use 'tpope/vim-sexp-mappings-for-regular-people'        --- better mappings for vim-sexp

        --- Discoverability
        use 'nvim-lua/popup.nvim'                               --- dependency for telescope
        use 'nvim-lua/plenary.nvim'                             --- dependency for telescope
        use 'nvim-telescope/telescope.nvim'                     --- extensible fuzzy finder
        use 'tpope/vim-projectionist'                           --- Sets up associations/behaviors between files
        use 'majutsushi/tagbar'                                 --- File function outliner
        use 'kyazdani42/nvim-tree.lua'                          --- File tree explorer

        --- Linting/Completion
        use 'ncm2/ncm2'                                         --- Completion engine
        use 'SirVer/ultisnips'                             --- Snippet engine
        use 'honza/vim-snippets'                    --- Snippets

        --- Programming
        use 'neovim/nvim-lspconfig'                             --- Builtin LSP Config
        use 'hrsh7th/nvim-compe'                                --- completion
        use 'vim-test/vim-test'                                 --- Test framework plugin
        use 'mattn/emmet-vim'                                   --- emmet integration
        -- use 'fatih/vim-go'                                      --- golang
        use 'Olical/conjure'                                    --- lisp-like langs

        --- Version Control
        use 'tpope/vim-fugitive'                                --- Vim git client
        use 'tpope/vim-rhubarb'                                 --- Open Github for open files in vim
        use 'airblade/vim-gitgutter'                            --- Shows git changes on side bar
        use 'tommcdo/vim-fugitive-blame-ext'                    --- shows commit in blame window
        use 'rhysd/conflict-marker.vim'                         --- hop between git conflicts with [x and ]x
    end)
end

declare_deps()
require('plugins.lsp.init')
require('plugins.vimtest')
require('plugins.telescope')

require'compe'.setup({
  enabled = true,
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
  },
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--- new packages after this file is written to
-- vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
