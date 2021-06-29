vim.cmd('autocmd ColorScheme * highlight clear SignColumn')
vim.cmd('autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE')
vim.cmd('hi clear LspDiagnosticsDefaultError')
vim.cmd('hi clear LspDiagnosticsDefaultWarning')
vim.cmd('hi clear LspDiagnosticsDefaultHint')
vim.cmd('hi clear LspDiagnosticsDefaultInformation')
vim.cmd('hi link LspDiagnosticsVirtualTextError ErrorMsg')
vim.cmd('hi link LspDiagnosticsVirtualTextWarning ErrorMsg')
vim.cmd('hi link LspDiagnosticsVirtualTextHint ErrorMsg')
vim.cmd('hi link LspDiagnosticsVirtualTextInformation ErrorMsg')
vim.cmd('hi link LspDiagnosticsFloatingError NormalFloat')
vim.cmd('hi link LspDiagnosticsFloatingWarning NormalFloat')
vim.cmd('hi link LspDiagnosticsFloatingHint NormalFloat')
vim.cmd('hi link LspDiagnosticsFloatingInformation NormalFloat')
vim.cmd('hi link LspDiagnosticsSignError ErrorMsg')
vim.cmd('hi link LspDiagnosticsSignWarning ErrorMsg')
vim.cmd('hi link LspDiagnosticsSignHint ErrorMsg')
vim.cmd('hi link LspDiagnosticsSignInformation ErrorMsg')
vim.cmd('hi clear LspDiagnosticsUnderlineError')
vim.cmd('hi clear LspDiagnosticsUnderlineWarning')
vim.cmd('hi clear LspDiagnosticsUnderlineHint')
vim.cmd('hi clear LspDiagnosticsUnderlineInformation')
vim.cmd('hi link LspDiagnosticsUnderlineError SpellBad')
vim.cmd('hi link LspDiagnosticsUnderlineWarning SpellBad')
vim.cmd('hi link LspDiagnosticsUnderlineHint SpellBad')
vim.cmd('hi link LspDiagnosticsUnderlineInformation SpellBad')
