class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.5/runa-macos-aarch64.tar.gz"
      sha256 "b04eb48e597c4a3e7574be43ed3f3d30e1bba5bfd7506f6c574d86af3157dfd6"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.5/runa-macos-x86_64.tar.gz"
      sha256 "ca8b751a314092f5258c73e50526fd1cec720b9b2c25adcf59c94a022d8e632d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.5/runa-linux-aarch64.tar.gz"
      sha256 "aa6354bd44a1d73d612e34e782d5a34a090127b78604e3dd70beb76f32ab9399"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v0.5.5/runa-linux-x86_64.tar.gz"
      sha256 "943b8fb6667432b5dfab7369ad7ab4d8fa860f016f772337e6c5eb5911477a36"
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
