# Homebrew OpenVAF

Homebrew tap for [OpenVAF-Reloaded](https://github.com/robtaylor/OpenVAF), a Verilog-A compiler that outputs OSDI-compatible dynamic libraries.

## Installation

### Install latest release (recommended)

```bash
brew tap robtaylor/openvaf
brew install openvaf-r
```

Or install directly:

```bash
brew install robtaylor/openvaf/openvaf-r
```

This installs a pre-built binary, which is faster than building from source.

### Install HEAD (latest development version)

To build from the latest source code:

```bash
brew install --HEAD robtaylor/openvaf/openvaf-r
```

Note: HEAD builds require Rust and LLVM 18, which will be installed automatically.

## Usage

After installation, the `openvaf-r` binary will be available:

```bash
# Check version
openvaf-r --version

# Compile a Verilog-A model
openvaf-r model.va -o model.osdi

# Show help
openvaf-r --help
```

## About OpenVAF-Reloaded

OpenVAF is a Verilog-A compiler that outputs dynamic libraries compatible with the OSDI API (version 0.4). The compiler was originally written by Pascal Kuthe and is now maintained as OpenVAF-Reloaded with continued development and bug fixes.

### OSDI 0.4 Features

- Support for reading param given flags
- Jacobian contributions to arrays
- List of model inputs (node pairs)
- Functions for loading Jacobians with offset (for harmonic balance)
- Exposed natures, disciplines, and attributes

## Requirements

- macOS 13+ (Ventura or later)
- Apple Silicon (ARM64) or Intel (x86_64)

For release builds, no additional dependencies are required - the binary is self-contained.

For HEAD builds, the following are installed automatically:
- LLVM 18
- Rust toolchain

## Updating

```bash
# Update the tap
brew update

# Upgrade openvaf-r
brew upgrade openvaf-r
```

## Troubleshooting

### HEAD build fails

If building from HEAD fails, ensure you have the latest Xcode Command Line Tools:

```bash
xcode-select --install
```

### Release version not found

If the release URL returns 404, the release may not have been published yet. Use `--HEAD` to build from source instead.

## Documentation

- [OpenVAF-Reloaded Documentation](https://github.com/robtaylor/OpenVAF)
- [OSDI Specification](https://github.com/robtaylor/OpenVAF/tree/master/openvaf/osdi/header)
- Homebrew documentation: `brew help`, `man brew` or [docs.brew.sh](https://docs.brew.sh)

## Contributing

Issues and pull requests welcome at https://github.com/robtaylor/homebrew-openvaf
