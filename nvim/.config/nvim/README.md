NORMAL MODE:

Navigation:
- j, k, <Up>, <Down>: Move through wrapped lines intelligently
- <C-h/j/k/l>: Move focus between windows
- ]c, [c: Jump to next/previous git change
- ]d, [d: Go to next/previous diagnostic message
- gd: Goto Definition (LSP)
- gD: Goto Declaration (LSP)
- gr: Goto References (LSP)
- gI: Goto Implementation (LSP)
- n, N: Next/Previous search result with better behavior

File/Buffer Management:
- <leader>ff: Find Files
- <leader>f.: Find Recent Files
- <leader>fg: Find by Grep
- <leader>f/: Find in Open Files
- <leader>fn: Find Neovim config files
- <leader><leader>: Find existing buffers

Case Manipulation:
- ~: Toggle case of character under cursor
- guw: Make word lowercase
- gUw: Make word uppercase
- guiw: Make inner word lowercase
- gUiw: Make inner word uppercase
- guu: Make line lowercase
- gUU: Make line uppercase
- gu{motion}: Make motion lowercase (e.g., gu$)
- gU{motion}: Make motion uppercase (e.g., gU$)

Code Actions & LSP:
- K: Show hover documentation
- <leader>ca: Code Action
- <leader>rn: Rename symbol
- <leader>D: Type Definition
- <leader>ds: Document Symbols
- <leader>ws: Workspace Symbols
- <leader>e: Show diagnostic error messages
- <leader>q: Open diagnostic quickfix list

Git Operations:
- <leader>hs: Stage hunk
- <leader>hr: Reset hunk
- <leader>hS: Stage buffer
- <leader>hu: Undo stage hunk
- <leader>hR: Reset buffer
- <leader>hp: Preview hunk
- <leader>hb: Blame line
- <leader>hd: Diff against index
- <leader>hD: Diff against last commit

Debugging:
- <F5>: Debug Start/Continue
- <F1>: Debug Step Into
- <F2>: Debug Step Over
- <F3>: Debug Step Out
- <F7>: Toggle debug UI
- <leader>cb: Toggle breakpoint
- <leader>cB: Set conditional breakpoint

Toggles & Misc:
- <Esc>: Clear search highlighting
- <leader>th: Toggle inlay hints
- <leader>tb: Toggle git blame line
- <leader>tD: Toggle show git deleted

VISUAL MODE:
- <, >: Better indenting (stays in visual mode)
- <A-j>, <A-k>: Move selected lines up/down
- <leader>hs: Stage selected hunk
- <leader>hr: Reset selected hunk

INSERT MODE:
- <A-j>, <A-k>: Move current line up/down

TERMINAL MODE:
- <Esc><Esc>: Exit terminal mode (easier alternative to <C-\\><C-n>)

The keybindings show a well-organized system focused on:
- Efficient navigation between files, symbols, and definitions
- Comprehensive Git integration
- Full LSP (Language Server Protocol) support
- Debugging capabilities
- Text manipulation and movement
- Fuzzy finding and searching

Most commands use the <leader> key as a prefix for complex operations, while keeping common operations accessible with direct keystrokes. The bindings follow common Vim conventions while adding modern IDE-like capabilities through LSP and debugging integrations.

