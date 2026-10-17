class MacCleanup < Formula
  desc "Modular macOS developer storage cleanup CLI"
  homepage "https://github.com/PiusSunday/mac-cleanup"
  # url and sha256 are rewritten by the release workflow on every v*.*.* tag.
  url "https://github.com/PiusSunday/mac-cleanup/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "4080e9c139c7c374995b44172abce4bb5dca5457887ea899242ad268409f19d9"
  license "MIT"
  head "https://github.com/PiusSunday/mac-cleanup.git", branch: "main"

  def install
    bin.install "bin/mac-cleanup"
    libexec.install Dir["lib/*"]

    # Patch the lib source path inside the binary
    inreplace bin/"mac-cleanup", 'LIB_DIR="${SCRIPT_DIR}/../lib"',
              "LIB_DIR=\"#{libexec}\""
  end

  test do
    system "#{bin}/mac-cleanup", "--help"
    assert_match "mac-cleanup v", shell_output("#{bin}/mac-cleanup --version")
  end
end
