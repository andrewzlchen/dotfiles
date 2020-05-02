" Fewer typos
command -complete=file -bang -nargs=? W  :w<bang> <args>
command -complete=file -bang -nargs=? Wq :wq<bang> <args>
command -complete=file -bang -nargs=? WQ :wq<bang> <args>
command -complete=file -bang -nargs=? Q :q<bang> <args>

" For testing in baas
command -complete=file -bang -nargs=? BaasTest :!go test -exec "baas_env" <bang> <args>

