class OpenvafR < Formula
  desc "Verilog-A compiler that outputs OSDI-compatible dynamic libraries"
  homepage "https://github.com/OpenVAF/OpenVAF-Reloaded"
  license "GPL-3.0"
  head "https://github.com/robtaylor/OpenVAF.git", branch: "master"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "llvm@18"

  def install
    # Set LLVM environment for the build
    ENV["LLVM_SYS_181_PREFIX"] = Formula["llvm@18"].opt_prefix
    ENV.prepend_path "PATH", Formula["llvm@18"].opt_bin

    # Build the release binary
    system "cargo", "build", "--release", "--bin", "openvaf-r"

    # Install the binary
    bin.install "target/release/openvaf-r"
  end

  test do
    # Basic version/help test
    system bin/"openvaf-r", "--version"
  end
end
