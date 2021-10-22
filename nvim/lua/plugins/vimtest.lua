local fn = vim.fn

vim.g['test#strategy'] = 'neovim'

if fn.getcwd() == "/Users/andrew.chen/Code/mongodb/baas" then
    vim.g['test#go#gotest#options'] = '-exec="env LD_LIBRARY_PATH=/Users/andrew.chen/Code/mongodb/baas/etc/dylib/lib" -v -tags debug'
end

