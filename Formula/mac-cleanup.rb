class MacCleanup < Formula
  desc "Modular macOS developer storage cleanup CLI"
  homepage "https://github.com/PiusSunday/mac-cleanup"
  url "https://github.com/PiusSunday/mac-cleanup/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "b6471be362d729e4ba6fc048d53e951b48155b5a54e3ea8aa80b91602b64fffb"
  license "MIT"

  def install
    bin.install "bin/mac-cleanup"
    libexec.install Dir["lib/*.sh"]

    # Patch the lib source path inside the binary
    inreplace bin/"mac-cleanup", 'LIB_DIR="${SCRIPT_DIR}/../lib"',
              "LIB_DIR=\"#{libexec}\""
  end

  test do
    system "#{bin}/mac-cleanup", "--help"
  end
end
