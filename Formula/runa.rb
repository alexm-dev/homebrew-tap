class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  version "0.12.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "4281bbfbff5164d529bf8866174511f68b47e70bf8f1814cb631aff5491c5cb8"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "12ab38f786920dab6c46aa15987dcd5023f7758e9d69587e147c6cabd36f8d85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "1589dcd64413a431c7258e29cb4271b18298d3c91166b568b03df2630bbdcd68"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "10ceddc33e6aa58ac862d67fb3476f0768c618f8ca531611adc4b73a7402ad22"
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
