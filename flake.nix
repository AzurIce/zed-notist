{
  description = "zed-notist";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      rust-overlay,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };
        # Zed 扩展编译为 wasm32-wasip2（当前 Zed 的 RUST_TARGET）
        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          targets = [ "wasm32-wasip2" ];
        };
      in
      {
        # 暴露为可安装 package：`nix profile install .#default` 后
        # cargo/rustc（含 wasm32-wasip2 target）与 C 工具链进入用户 PATH，
        # 桌面启动的 Zed 编译 dev extension、以及 `cargo run` 构建 notist
        # 时都能找到它们（rust 工具链本身不带 cc）。
        packages.default = pkgs.symlinkJoin {
          name = "zed-notist-toolchain";
          paths = [ rustToolchain pkgs.gcc pkgs.pkg-config pkgs.binutils ];
        };
        devShells.default = pkgs.mkShell {
          packages = [ rustToolchain ];
        };
      }
    );
}
