vim.o.projectionist_heuristics = {
    ['*'] = {
        ["*.go"] = {
          alternate = {
            "{dirname}/{basename}_test.go",
            "{dirname}/{basename}_ext_test.go",
          },
         type = "source",
        },
        ["*_test.go"] = {
          alternate = {
            "{dirname}/{basename}.go",
          },
          type = "test",
        },

        ["*.ts"] = {
            alternate = {
                "{basename}.test.ts", "{basename}.test.tsx",
                "{dirname}/__tests__/{basename}.ts",
                "{dirname}/__tests__/{basename}.tsx"
            },
            type = "source"
        },
        ["*.test.ts"] = {
            alternate = {
              "{dirname}/{basename}.ts",
              "{dirname}/{basename}.tsx",
            },
            type = "test"
        },
        ["*.tsx"] = {
            alternate = {
                "{basename}.test.tsx",
                "{basename}.test.ts",
            },
            type = "component"
        },
        ["*.test.tsx"] = {
            alternate = {
              "{}.tsx",
              "{}.less",
            },
            type = "test",
          }
        },
    }
}
