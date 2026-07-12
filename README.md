# Notist for Zed

Zed language support for `.not` documents.

The extension currently provides:

- Tree-sitter syntax highlighting
- wiki reference highlighting
- content and raw call highlighting
- dynamic language injection for `#raw(lang="...")![...]!`
- bracket matching, indentation, folding, and heading outline items

Install it locally from Zed's Extensions page with **Install Dev Extension**, then select this directory.

The development manifest references a local read-only Git daemon at `git://127.0.0.1:9418/tree-sitter-notist`. Start it with `git daemon --reuseaddr --base-path=E:/_noting --export-all --listen=127.0.0.1 --port=9418` before installing the dev extension. Replace this URL with a public HTTPS repository before publishing.
