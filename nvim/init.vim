source $HOME/.config/nvim/nvim_config/init.vimrc
source $HOME/.config/nvim/nvim_config/general.vimrc
source $HOME/.config/nvim/nvim_config/plugins.vimrc
source $HOME/.config/nvim/nvim_config/keys.vimrc

" SETTINGS
    colo gruvbox
    let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
    let g:seiya_auto_enable=1
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermfg=NONE


