class RunaBin < Formula
  desc "Fast and lightweight terminal file browser (Binary)"
  homepage "https://github.com/alexm-dev/runa"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.3/runa-aarch64-apple-darwin.tar.gz"
      sha256 "MAC_ARM_SHA"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.3/runa-x86_64-apple-darwin.tar.gz"
      sha256 "MAC_X86_SHA"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.3/runa-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "LINUX_ARM_SHA"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.3/runa-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "LINUX_X86_SHA"
    end
  end

  def install
    bin.install "rn"

    doc.install "LICENSE-MIT" if File.exist? "LICENSE-MIT"
    doc.install "LICENSE-APACHE" if File.exist? "LICENSE-APACHE"
    doc.install "README.md" if File.exist? "README.md"

    if File.directory? "docs"
      doc.install "docs/configuration.md" if File.exist? "docs/configuration.md"
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/rn --help")
  end
end
