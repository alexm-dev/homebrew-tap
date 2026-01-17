class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.3/runa-macos-aarch64.tar.gz"
      sha256 "41dc2e95e171fc789d6704da4a9741325ef738ff0313383f8612aa2ccbc82245"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.3/runa-macos-x86_64.tar.gz"
      sha256 "4c77ec0fc3c68f37e17a23a24d2512cb53ffdcd45fba52a3bcd4d712a2a17a91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.3/runa-linux-aarch64.tar.gz"
      sha256 "f3c47acbba1b0dd58459014967fd2e589cbd07d21d2def400ea720164023db67"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.3/runa-linux-x86_64.tar.gz"
      sha256 "08e0ad66c4806f80ad2e4c261ec27874844834e54a43c3b514c19a9ffd59cf2a"
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
