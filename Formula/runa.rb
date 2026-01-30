class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  version "0.5.13"
  license any_of: ["MIT", "Apache-2.0"]

  def pour_bottle?
    true
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "f8d25e80e17ee683c242c18576908a2cacc270f4cfee68319542e078d8cb6bd6"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "bf195b494365a8249f9bdaa7191ed2f078294b291fd7aa440cbdc14c5b4d504d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-aarch64.tar.gz"
      sha256 "104f8fb7e3fbda5b20d05564deddfdcc68d4d5a47cb0617c968f9ce09f0c8fe1"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-x86_64.tar.gz"
      sha256 "bb88756a713ba63beb537537e7d39f14bc243c4982381c2b0ce3f635c1f24ee9"
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
    assert_match version.to_s, shell_output("#{bin}/rn --version")
  end
end
