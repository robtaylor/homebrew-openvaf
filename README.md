# Homebrew OpenVAF

Homebrew tap for [OpenVAF-reloaded](https://github.com/OpenVAF/OpenVAF-Reloaded), a Verilog-A compiler that outputs OSDI-compatible dynamic libraries.

## Installation

```bash
brew tap robtaylor/openvaf
brew install openvaf-r
```

Or install directly:

```bash
brew install robtaylor/openvaf/openvaf-r
```

### Install HEAD (latest development version)

```bash
brew install --HEAD robtaylor/openvaf/openvaf-r
```

## Usage

After installation, the `openvaf-r` binary will be available:

```bash
openvaf-r --version
openvaf-r --help
```

## About OpenVAF-reloaded

OpenVAF is a Verilog-A compiler that outputs dynamic libraries compatible with the OSDI API (version 0.4). The compiler was originally written by Pascal Kuthe and is now maintained as OpenVAF-reloaded with continued development and bug fixes.

### OSDI 0.4 Features

- Support for reading param given flags
- Jacobian contributions to arrays
- List of model inputs (node pairs)
- Functions for loading Jacobians with offset (for harmonic balance)
- Exposed natures, disciplines, and attributes

## Requirements

- macOS (tested on macOS 13+)
- LLVM 18 (automatically installed as dependency)
- Rust toolchain (automatically installed as dependency)

## Documentation

- [OpenVAF-reloaded README](https://github.com/OpenVAF/OpenVAF-Reloaded)
- [OSDI Specification](https://github.com/OpenVAF/OpenVAF-Reloaded/tree/master/openvaf/osdi/header)
- Homebrew documentation: `brew help`, `man brew` or [docs.brew.sh](https://docs.brew.sh)

## Contributing

Issues and pull requests welcome at https://github.com/robtaylor/homebrew-openvaf
