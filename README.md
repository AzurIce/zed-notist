# Notist for Zed

Zed language support for `.not` documents.

The extension currently provides:

- Tree-sitter syntax highlighting
- wiki reference highlighting
- call, string literal, and raw element highlighting
- language injection for fenced raw blocks and `#raw(text=r#"..."#, lang="...")`
- bracket matching, indentation, folding, and heading outline items
- live diagnostics from unsaved documents
- module path and built-in function completion
- module navigation, references, and hover information

The language server is provided by the main Notist executable. Build it and make sure `notist` is available in the PATH inherited by Zed:

```powershell
cargo install --locked --git https://github.com/AzurIce/Notist.git notist-cli
```

Install this extension locally from Zed's Extensions page with **Install Dev Extension**, then select this directory.

The Tree-sitter grammar is pinned to a published revision of [AzurIce/tree-sitter-notist](https://github.com/AzurIce/tree-sitter-notist).

Place an empty `Notist.toml` at each vault root. The language server discovers the nearest marker for every `.not` document and keeps multiple vaults in the same Zed worktree isolated. When no marker exists, the worktree root remains an implicit vault for compatibility.
