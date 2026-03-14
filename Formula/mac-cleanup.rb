class MacCleanup < Formula
  desc "Modular macOS developer storage cleanup CLI"
  homepage "https://github.com/PiusSunday/mac-cleanup"
  url "https://github.com/PiusSunday/mac-cleanup/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "dd752eb2946eb0af73dd675a8d5e3c628cf72b2fd67e727efc26ec65a6b95dbd"
  license "MIT"

  def install
    bin.install "bin/mac-cleanup"
    libexec.install Dir["lib/*"]

    # Patch the lib source path inside the binary
    inreplace bin/"mac-cleanup", 'LIB_DIR="${SCRIPT_DIR}/../lib"',
              "LIB_DIR=\"#{libexec}\""
  end

  test do
    system "#{bin}/mac-cleanup", "--help"
  end
end
