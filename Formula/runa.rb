class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  version "0.11.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "66abe48cdfc4e7b4fd90680268e4d8dfda045e9d421a895e22e0692842ba28ee"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "34afc4484465a7f00464335d0c44bd2ca5657a60e80b88673f753060a09b9043"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "fc175e473d2f781d3b5104efafa8e40a9282d69ac8319e0dce68b9de4c6a1c6a"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "f51f33f091495a303d81c78333fb2d5008ac31fb86cf51643df186742dbf783d"
    end
  end

  def install
    bin.install "rn"

    doc.install "LICENSE-MIT" if File.exist? "LICENSE-MIT"
    doc.install "LICENSE-APACHE" if File.exist? "LICENSE-APACHE"
    doc.install "README.md" if File.exist? "README.md"

    if File.directory? "docs/config"
      doc.install "docs/configuration.md" if File.exist? "docs/configuration.md"

      if File.directory? "docs/config-reference"
        doc.install "docs/config-reference"
      end
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/rn --help")
    assert_match version.to_s, shell_output("#{bin}/rn --version")
  end
end
