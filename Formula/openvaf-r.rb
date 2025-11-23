class OpenvafR < Formula
  desc "Verilog-A compiler that outputs OSDI-compatible dynamic libraries"
  homepage "https://github.com/OpenVAF/OpenVAF-Reloaded"
  license "GPL-3.0-or-later"
  head "https://github.com/robtaylor/OpenVAF.git", branch: "master"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "llvm@18"

  def install
    # Set LLVM environment for the build
    ENV["LLVM_SYS_181_PREFIX"] = Formula["llvm@18"].opt_prefix
    ENV.prepend_path "PATH", Formula["llvm@18"].opt_bin

    # Build and install the binary
    system "cargo", "install", *std_cargo_args(path: "openvaf/openvaf-driver")
  end

  test do
    # Basic version/help test
    system bin/"openvaf-r", "--version"
  end
end
