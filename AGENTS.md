# AGENTS.md

## `grammars/` 目录归 Zed 管理

`grammars/notist` 是 Zed 安装 dev extension 时自动 clone 的 grammar 缓存仓库
（因此被 gitignore），不要手动复制或 rsync 文件进去——那会把 clone 弄脏，
导致 Zed checkout 钉住的 rev 时报 "local changes would be overwritten"。

更新 grammar 的正确姿势：

1. 在 tree-sitter-notist 仓库提交并 push；
2. 把新 rev 写进 `extension.toml` 的 `[grammars.notist] rev`，并同步
   `languages/notist/*.scm`（从 grammar 仓库的 `queries/` 拷贝）；
3. 在 Zed 里重新 Install Dev Extension（Zed 会自动 fetch + checkout +
   重编译 `grammars/notist.wasm`）。

如果缓存已经脏了，在 `grammars/notist` 里
`git fetch origin && git reset --hard <rev>` 即可。
