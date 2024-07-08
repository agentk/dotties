# NORMAL MODE

Source not specified indicates builtin behaviour.

## Getting help

| Keybinding   | Description       | Source  |
| ------------ | ----------------- | ------- |
| `<leader>sh` | Search Help Pages | fzf-lua |
| `<leader>sk` | Search Key Maps   | fzf-lua |

## Navigation

| Keybinding                 | Description                                      | Source   |
| -------------------------- | ------------------------------------------------ | -------- |
| `j`, `k`, `<Up>`, `<Down>` | Move through wrapped lines intelligently         | keymaps  |
| `<C-h/j/k/l>`              | Move focus between windows                       | keymaps  |
| `]c`, `[c`                 | Jump to next/previous git change                 | gitsigns |
| `]d`, `[d`                 | Go to next/previous diagnostic message           |          |
| `n`, `N`                   | Next/Previous search result with better behavior |          |

## File/Buffer Management

| Keybinding                | Description                     | Source  |
| ------------------------- | ------------------------------- | ------- |
| `<leader><space>`         | Find Buffers                    | fzf-lua |
| `<leader>fc`              | Find Config Files               | fzf-lua |
| `<leader>,`, `<leader>ff` | Find Files                      | fzf-lua |
| `<leader>fF`              | Find Files (cwd)                | fzf-lua |
| `<leader>fg`              | Find Files (git-files)          | fzf-lua |
| `<leader>fr`              | Find Recent Files               | fzf-lua |
| `<leader>fR`              | Find Recent Files (cwd)         | fzf-lua |
| - -                       |                                 |         |
| `<leader>s"`              | Search Registers                | fzf-lua |
| `<leader>sa`              | Search Auto Commands            | fzf-lua |
| `<leader>sb`              | Search Buffer                   | fzf-lua |
| `<leader>:`               | Search Command History          | fzf-lua |
| `<leader>sC`              | Search Commands                 | fzf-lua |
| `<leader>sd`              | Search Document Diagnostics     | fzf-lua |
| `<leader>sD`              | Search Workspace Diagnostics    | fzf-lua |
| `<leader>/`               | Search Grep (Root Dir)          | fzf-lua |
| `<leader>sG`              | Search Grep (cwd)               | fzf-lua |
| `<leader>sH`              | Search Search Highlight Groups  | fzf-lua |
| `<leader>sj`              | Search Jumplist                 | fzf-lua |
| `<leader>sl`              | Search Location List            | fzf-lua |
| `<leader>sM`              | Search Man Pages                | fzf-lua |
| `<leader>sm`              | Search Jump to Mark             | fzf-lua |
| `<leader>sR`              | Search Resume                   | fzf-lua |
| `<leader>sq`              | Search Quickfix List            | fzf-lua |
| `<leader>sw`              | Search Word (Root Dir)          | fzf-lua |
| `<leader>sW`              | Search Word (cwd)               | fzf-lua |
| `<leader>uC`              | Search Colorscheme with Preview | fzf-lua |

## Case Manipulation

| Keybinding   | Description                           | Source |
| ------------ | ------------------------------------- | ------ |
| `~`          | Toggle case of character under cursor |        |
| `guw`        | Make word lowercase                   |        |
| `gUw`        | Make word uppercase                   |        |
| `guiw`       | Make inner word lowercase             |        |
| `gUiw`       | Make inner word uppercase             |        |
| `guu`        | Make line lowercase                   |        |
| `gUU`        | Make line uppercase                   |        |
| `gu{motion}` | Make motion lowercase (e.g., `gu$`)   |        |
| `gU{motion}` | Make motion uppercase (e.g., `gU$`)   |        |

## Auto completion & Snippets

| Keybinding                       | Description                            | Source |
| -------------------------------- | -------------------------------------- | ------ |
| `<C-space>`                      | Open menu or open docs if already open | blink  |
| `<C-e>`                          | Hide menu                              | blink  |
| `<C-n>`/`<C-p>`, `<Up>`/`<Down>` | Select next/previous item              | blink  |
| `<C-y>`                          | Select and accept                      | blink  |
| `<C-b>`/`<C-f>`                  | Scroll documentation up / down         | blink  |
| `<Tab>`/`<S-Tab>`                | Snippet forward / backward             | blink  |
| `<C-k>`                          | Toggle signature help                  | blink  |

## Code Actions & LSP

| Keybinding             | Description                            | Source  |
| ---------------------- | -------------------------------------- | ------- |
| `]d`, `[d`             | Go to next/previous diagnostic message |         |
| `<C-w>d`, `<C-w><C-d>` | Show hover diagnostics                 |         |
| `K`                    | Show hover documentation               |         |
| `<C-s>`                | Display signature help                 |         |
| `gd`                   | Goto definition                        | lsp     |
| `gD`                   | Goto declaration                       | lsp     |
| `gra`                  | Code Action                            |         |
| `grn`                  | Rename symbol                          |         |
| `grr`                  | List references                        |         |
| `gri`                  | List implimentations                   |         |
| `<leader>ss`, `gO`     | Document Symbols                       | fzf-lua |
| `<leader>sS`           | Workspace Symbols                      | fzf-lua |
| `<leader>cf`           | Code format                            | conform |
| `<leader>th`           | Toggle inlay hints                     | lsp     |
| <leader>e              | Show diagnostic error messages         | ?       |
| <leader>q              | Open diagnostic quickfix list          | ?       |

## Avante

| Keybinding   | Description                                               | Source |
| ------------ | --------------------------------------------------------- | ------ |
| `<leader>a?` | Select model                                              | Avante |
| `<leader>aa` | ask                                                       | Avante |
| `<leader>aB` | add_all_buffers -- Add all buffer files to selected files | Avante |
| `<leader>ac` | add_current -- Add current buffer to selected files       | Avante |
| `<leader>ad` | debug                                                     | Avante |
| `<leader>ae` | edit                                                      | Avante |
| `<leader>af` | focus                                                     | Avante |
| `<leader>ah` | hint                                                      | Avante |
| `<leader>ah` | Select history                                            | Avante |
| `<leader>an` | new_ask                                                   | Avante |
| `<leader>ar` | refresh                                                   | Avante |
| `<leader>aR` | repomap                                                   | Avante |
| `<leader>aS` | stop                                                      | Avante |
| `<leader>as` | suggestion                                                | Avante |
| `<leader>at` | default                                                   | Avante |

## Git Operations

| Keybinding   | Description              | Source   |
| ------------ | ------------------------ | -------- |
| `<leader>gc` | Find Commits             | fzf-lua  |
| `<leader>gs` | Find Status              | fzf-lua  |
| <leader>hs   | Stage hunk               | gitsigns |
| <leader>hr   | Reset hunk               | gitsigns |
| <leader>hS   | Stage buffer             | gitsigns |
| <leader>hu   | Undo stage hunk          | gitsigns |
| <leader>hR   | Reset buffer             | gitsigns |
| <leader>hp   | Preview hunk             | gitsigns |
| <leader>hb   | Blame line               | gitsigns |
| <leader>hd   | Diff against index       | gitsigns |
| <leader>hD   | Diff against last commit | gitsigns |

## Debugging

| Keybinding | Description                | Source      |
| ---------- | -------------------------- | ----------- |
| <F5>       | Debug Start/Continue       | nvim-dap    |
| <F1>       | Debug Step Into            | nvim-dap    |
| <F2>       | Debug Step Over            | nvim-dap    |
| <F3>       | Debug Step Out             | nvim-dap    |
| <F7>       | Toggle debug UI            | nvim-dap-ui |
| <leader>cb | Toggle breakpoint          | nvim-dap    |
| <leader>cB | Set conditional breakpoint | nvim-dap    |

## Toggles & Misc

| Keybinding | Description               | Source        |
| ---------- | ------------------------- | ------------- |
| <Esc>      | Clear search highlighting | vim           |
| <leader>tb | Toggle git blame line     | gitsigns.nvim |
| <leader>tD | Toggle show git deleted   | gitsigns.nvim |

## VISUAL MODE

| Keybinding   | Description                             | Source        |
| ------------ | --------------------------------------- | ------------- |
| <, >         | Better indenting (stays in visual mode) | vim           |
| <A-j>, <A-k> | Move selected lines up/down             | vim           |
| <leader>hs   | Stage selected hunk                     | gitsigns.nvim |
| <leader>hr   | Reset selected hunk                     | gitsigns.nvim |

## INSERT MODE

| Keybinding   | Description               | Source |
| ------------ | ------------------------- | ------ |
| <A-j>, <A-k> | Move current line up/down | vim    |

## TERMINAL MODE

| Keybinding | Description                                            | Source |
| ---------- | ------------------------------------------------------ | ------ |
| <Esc><Esc> | Exit terminal mode (easier alternative to <C-\\><C-n>) | vim    |
