--[[

https://github.com/redhat-developer/yaml-language-server

To use a schema for validation, there are two options:

1. Add a modeline to the file. A modeline is a comment of the form:

```
# yaml-language-server: $schema=<urlToTheSchema|relativeFilePath|absoluteFilePath}>
```

where the relative filepath is the path relative to the open yaml file, and the absolute filepath
is the filepath relative to the filesystem root ('/' on unix systems)

2. Associated a schema url, relative , or absolute (to root of project, not to filesystem root) path to
the a glob pattern relative to the detected project root. Check `:LspInfo` to determine the resolved project
root.

```lua
require('lspconfig').yamlls.setup {
  ... -- other configuration for setup {}
  settings = {
    yaml = {
      ... -- other settings. note this overrides the lspconfig defaults.
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        ["/path/from/root/of/project"] = "/.github/workflows/*",
      },
    },
  }
}
```

--]]
-- https://neovim.io/doc/user/lsp.html#vim.lsp.Config
---@type vim.lsp.Config
return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = {
    'yaml',
    'yaml.docker-compose',
    'yaml.gitlab',
    'yaml.helm-values',
  },
  root_markers = { '.git' },
  settings = {
    -- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
    redhat = { telemetry = { enabled = false } },
  },
  capabilities = require('util').lsp_extend_capabilities(),
}
