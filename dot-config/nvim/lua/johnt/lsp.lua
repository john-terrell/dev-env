vim.lsp.enable({'clangd', 'zls'})

vim.lsp.config('*', {
    root_markers = { '.git', '.hg' },
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    }
})

vim.lsp.config("clangd", {
    cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
        '--offset-encoding=utf-8',
    },
    filetypes = { 'c', 'cpp' },
    root_markers = { '.git', '.clang-format', 'compile_commands.json' },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true,
                }
            }
        }
    }
})

vim.lsp.config("zls", {
    root_markers = { '.git' },
    semantic_tokens = 'partial';
})
