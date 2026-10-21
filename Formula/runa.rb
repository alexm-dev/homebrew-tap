class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  version "0.12.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "f1fb173c405b941e4f62a5208acd0111d5c970ca15c045034c107d76afc56730"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "e6cef47edf0dc2636357280af2079f92bcdd813b864e5e9cd26d1c006698ae4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "ba0066c9d97fe86da1c5428f0ebd00419b6642b1b9a8da74521003ef41a3da9c"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "b34e6c198f0f289c8c27c56c8ff0666c967a81b6aeba0cf1eca7704838b1142b"
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
    assert_match "USAGE", shell_output("#{bin}/rn --help")
    assert_match version.to_s, shell_output("#{bin}/rn --version")
  end
end
