# homebrew-tap

Personal Homebrew tap for tools maintained by [@Debbl](https://github.com/Debbl).

## Available formulae

| Formula | Description |
| ------- | ----------- |
| [`nci`](Formula/nci.rb) | Use the right package manager (Rust port of [@antfu/ni](https://github.com/antfu-collective/ni)) |

## Install

```sh
brew install Debbl/tap/nci
```

Or tap once, then install by name:

```sh
brew tap Debbl/tap
brew install nci
```

## Update

```sh
brew upgrade nci
```

## Supported platforms

| Target                      | Brew | Notes |
| --------------------------- | :--: | --- |
| macOS arm64 (Apple Silicon) | ✅   | Native build on `macos-14` |
| macOS x86_64 (Intel)        | ✅   | Cross-compiled on `macos-14` |
| Linux x86_64 (glibc)        | ✅   | Native build on `ubuntu-22.04` |
| Windows x86_64              | —    | Use the `.zip` archive from the release page directly |
| Linux arm64                 | —    | Not built yet |
| Linux musl                  | —    | Not built yet |

## How this tap stays current

Formulae here are bumped automatically by the release workflows in each
upstream repository — every `v*` tag recomputes the per-platform SHA256s and
pushes the updated formula into this tap.
