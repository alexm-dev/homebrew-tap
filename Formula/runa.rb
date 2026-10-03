class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  version "0.12.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "f5cc0fd64bce81556574c5abfb76616ad37729ee9f410248e3ead1403d5ad9ef"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "8508882ef12171bebd2f9017c94f96f1d0fdf90852df967b31255bcd76af383c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "cb34dc497abf6d534a2dbf5a7ae58d1b5772b1a9b1b8f58369bb926febd527d3"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "eb202b5148146df5e7c4c1d70e3d1e3dd54a9de93f8b90b4f65e2ee6f2669b11"
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
