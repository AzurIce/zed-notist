# Notist for Zed

Zed language support for `.not` markup documents and `.notc` code modules.

The extension currently provides:

- Tree-sitter syntax highlighting
- section, wikilink, attribute annotation, raw code, math, list marker, and link highlighting in markup
- interpolation, call, string, and collection highlighting in code
- bracket matching, indentation, folding, and section outline items
- live diagnostics from unsaved documents
- module path and built-in function completion
- module navigation, references, and hover information

The language server is provided by the main Notist executable. Build it and make sure `notist` is available in the PATH inherited by Zed:

```powershell
cargo install --locked --git https://github.com/AzurIce/Notist.git notist-cli
```

Install this extension locally from Zed's Extensions page with **Install Dev Extension**, then select this directory.

The Tree-sitter grammar is pinned to a published revision of [AzurIce/tree-sitter-notist](https://github.com/AzurIce/tree-sitter-notist). The current pin includes annotation, raw, math, list-marker, comment, and automatic-link tokens. When bumping the pin, commit and push the grammar first, then sync `languages/notist/*.scm` from the grammar's `queries/` directory.

Each package uses a `Notist.toml` with its package name, source directory, and entry module. The language server discovers packages beneath the opened worktree and shares analysis for path dependencies. Files outside packages still receive standalone syntax analysis.
