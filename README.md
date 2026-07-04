# Tripstack-Corp Homebrew Tap

Homebrew formulae for [**spyc**](https://github.com/Tripstack-Corp/spyc) — a
keyboard-driven, MCP-native terminal file commander.

## Install

```sh
brew install Tripstack-Corp/tap/spyc
```

or tap once, then install by name:

```sh
brew tap Tripstack-Corp/tap
brew install spyc
```

This installs the latest **RELEASE** (a prebuilt, signed universal macOS binary
or a static musl Linux binary — no compile).

## Bleeding edge (build `main` from source)

To track the **CURRENT** stream — spyc's rolling `main` — build from source:

```sh
brew install --HEAD Tripstack-Corp/tap/spyc
```

(Requires the Rust toolchain, which Homebrew installs as a build dependency.)

## Upgrade

```sh
brew update && brew upgrade spyc
```

## Verifying signatures

spyc releases are signed keyless (no stored keys) via Sigstore cosign and GitHub
build-provenance attestations. To verify a downloaded release tarball:

```sh
# attestation (provenance)
gh attestation verify spyc-<version>-<target>.tar.gz --repo Tripstack-Corp/spyc

# cosign-signed checksums
cosign verify-blob --bundle SHA256SUMS.cosign.bundle SHA256SUMS
```

## Platforms

| Platform | Artifact |
|---|---|
| macOS (Apple Silicon + Intel) | universal binary |
| Linux x86_64 | static (musl) |
| Linux aarch64 | static (musl) |

The formula is kept current automatically on each spyc release.
