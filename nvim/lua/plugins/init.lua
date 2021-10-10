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
        use 'Yggdroot/indentLine'                               --- Lines for showing tabs
        use 'gko/vim-coloresque'                                --- Colors in Vim #f00 #0f0 #00f
        use 'tpope/vim-unimpaired'                              --- pair keymaps
        use 'sindrets/diffview.nvim'

        --- Quality of Life Improvements
        use 'tpope/vim-commentary'                              --- Comments
        use 'terryma/vim-multiple-cursors'                      --- sublime text-like multi cursors
        use 'airblade/vim-rooter'                               --- set cwd to project root

        --- Discoverability
        use 'nvim-lua/popup.nvim'                               --- dependency for telescope
        use 'nvim-lua/plenary.nvim'                             --- dependency for telescope
        use 'nvim-telescope/telescope.nvim'                     --- extensible fuzzy finder
        use 'nvim-telescope/telescope-project.nvim'             --- projects
        use 'tpope/vim-projectionist'                           --- Sets up associations/behaviors between files
        use 'majutsushi/tagbar'                                 --- File function outliner
        use {
            'kyazdani42/nvim-tree.lua',                         --- File tree explorer
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require'nvim-tree'.setup {
              update_cwd = true,
            } end
        }
        use 'simrat39/symbols-outline.nvim'                     --- Methods outline

        --- Programming
        use 'neovim/nvim-lspconfig'                             --- Builtin LSP Config
        use 'vim-test/vim-test'                                 --- Test framework plugin
        use 'mattn/emmet-vim'                                   --- emmet integration
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use {
          "ray-x/lsp_signature.nvim",
        }
        use 'mfussenegger/nvim-dap'                              --- attachable debugging in nvim!
        use 'leoluz/nvim-dap-go'                                 --- dap golang features
        -- use 'Olical/conjure'                                    --- lisp-like langs

        use 'hrsh7th/cmp-nvim-lsp'                              --- completion
        use 'hrsh7th/cmp-buffer'                                --- completion
        use 'hrsh7th/nvim-cmp'                                  --- completion
        use 'hrsh7th/cmp-vsnip'                                 --- snippets
        use 'hrsh7th/vim-vsnip'                                 --- snippets

        --- Version Control
        use 'tpope/vim-fugitive'                                --- Vim git client
        use 'tpope/vim-rhubarb'                                 --- Open Github for open files in vim
        use 'airblade/vim-gitgutter'                            --- Shows git changes on side bar
        use 'tommcdo/vim-fugitive-blame-ext'                    --- shows commit in blame window
        use 'rhysd/conflict-marker.vim'                         --- hop between git conflicts with [x and ]x
        use {'pwntester/octo.nvim', config=function()
          require"octo".setup()
        end}
    end)
end

declare_deps()
require('plugins.lsp.init')
require('plugins.cmp')
require('plugins.vimtest')
require('plugins.telescope')

require'telescope'.load_extension('project')
require('dap-go').setup();

--- new packages after this file is written to
-- vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
