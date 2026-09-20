# Notist for Zed

Zed language support for `.not` markup documents and `.notc` code modules.

`.not` selects **Notist** with a fixed markup parser; `.notc` selects
**Notist Code** with a fixed code parser. Both languages connect to the same
Notist language server. Markdown files retain Zed's Markdown language.

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

Both Tree-sitter parsers are pinned to the same published revision of
[AzurIce/tree-sitter-notist](https://github.com/AzurIce/tree-sitter-notist).
When updating them, commit and push the grammar first, then update both revisions
in `extension.toml`. Sync the language queries using
`sh scripts/sync-queries.sh /path/to/tree-sitter-notist`; append `--check` to
verify that the checked-in queries match upstream. Each language has its own
complete configuration and queries; Zed does not inherit one from the other.

Each package uses a `Notist.toml` with its package name, source directory, and entry module. The language server discovers packages beneath the opened worktree and shares analysis for path dependencies. Files outside packages still receive standalone syntax analysis.
