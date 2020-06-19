" projectionist {{
let g:projectionist_heuristics = {
            \ "*": {
            \     "*.go": {
            \       "alternate": "{dirname}/{basename}_test.go",
            \       "type": "source",
            \     },
            \     "*_test.go": {
            \       "alternate": "{dirname}/{basename}.go",
            \       "type": "test",
            \     },
            \
            \     "*.js": {
            \       "alternate": [
            \            "{dirname}/__tests__/{basename}.js",
            \            "{dirname}/__tests__/{basename}.jsx",
            \            "{basename}.test.js",
            \            "{basename}.test.jsx",
            \       ],
            \       "type": "source",
            \     },
            \     "**/__tests__/*.js": {
            \       "alternate": [
            \            "{dirname}/{basename}.js",
            \            "{dirname}/{basename}.jsx",
            \       ],
            \       "type": "test",
            \     },
            \     "**/__tests__/*.jsx": {
            \       "alternate": [
            \            "{dirname}/{basename}.jsx",
            \            "{dirname}/{basename}.js",
            \       ],
            \       "type": "test",
            \     },
            \     "*.test.js": {
            \       "alternate": [
            \            "{dirname}/{basename}.js",
            \            "{dirname}/{basename}.jsx",
            \       ],
            \       "type": "test",
            \     },
            \     "*.test.jsx": {
            \       "alternate": [
            \            "{dirname}/{basename}.jsx",
            \            "{dirname}/{basename}.js",
            \       ],
            \       "type": "test",
            \     },
            \
            \     "*.ts": {
            \       "alternate": [
            \            "{basename}.test.ts",
            \            "{basename}.test.tsx",
            \            "{dirname}/__tests__/{basename}.ts",
            \            "{dirname}/__tests__/{basename}.tsx",
            \       ],
            \       "type": "source",
            \     },
            \     "*.tsx": {
            \       "alternate": [
            \            "{basename}.test.tsx",
            \            "{basename}.test.ts",
            \            "{dirname}/__tests__/{basename}.tsx",
            \            "{dirname}/__tests__/{basename}.ts",
            \       ],
            \       "type": "source",
            \     },
            \     "*.test.ts": {
            \       "alternate": [
            \            "{dirname}/{basename}.ts",
            \            "{dirname}/{basename}.tsx",
            \       ],
            \       "type": "test",
            \     },
            \     "*.test.tsx": {
            \       "alternate": [
            \            "{dirname}/{basename}.tsx",
            \            "{dirname}/{basename}.ts",
            \       ],
            \       "type": "test",
            \     },
            \     "**/__tests__/*.ts": {
            \       "alternate": [
            \            "{dirname}/{basename}.ts",
            \            "{dirname}/{basename}.tsx",
            \       ],
            \       "type": "test",
            \     },
            \     "**/__tests__/*.tsx": {
            \       "alternate": [
            \            "{dirname}/{basename}.tsx",
            \            "{dirname}/{basename}.ts",
            \       ],
            \       "type": "test",
            \     },
            \   }
            \ }
" }}
