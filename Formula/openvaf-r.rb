class OpenvafR < Formula
  desc "Verilog-A compiler that outputs OSDI-compatible dynamic libraries"
  homepage "https://github.com/robtaylor/OpenVAF"
  license "GPL-3.0-or-later"

  # For versioned releases, use pre-built binaries
  # Update version and sha256 values when creating a new release
  if build.head?
    head "https://github.com/robtaylor/OpenVAF.git", branch: "master"

    depends_on "pkg-config" => :build
    depends_on "rust" => :build
    depends_on "llvm@18"
  else
    version "23.5.0"

    on_macos do
      on_arm do
        url "https://github.com/robtaylor/OpenVAF/releases/download/v#{version}/openvaf-macos-arm64.tar.gz"
        # sha256 "UPDATE_WITH_ACTUAL_SHA256_FOR_ARM64"
      end
      on_intel do
        url "https://github.com/robtaylor/OpenVAF/releases/download/v#{version}/openvaf-macos-x86_64.tar.gz"
        # sha256 "UPDATE_WITH_ACTUAL_SHA256_FOR_X86_64"
      end
    end
  end

  def install
    if build.head?
      # Build from source for HEAD installations
      ENV["LLVM_SYS_181_PREFIX"] = Formula["llvm@18"].opt_prefix
      ENV.prepend_path "PATH", Formula["llvm@18"].opt_bin
      system "cargo", "install", *std_cargo_args(path: "openvaf/openvaf-driver")
    else
      # Install pre-built binary for versioned releases
      bin.install "openvaf-r"
    end
  end

  def caveats
    <<~EOS
      OpenVAF-R compiles Verilog-A models to OSDI 0.4 compatible dynamic libraries.

      Example usage:
        openvaf-r model.va -o model.osdi

      For HEAD builds, LLVM 18 is installed as a dependency.
      For release builds, the pre-built binary is used directly.
    EOS
  end

  test do
    system bin/"openvaf-r", "--version"
  end
end
