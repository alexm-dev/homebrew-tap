class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "b32dd9a523f2b5fcf5e859ab54f9d8c5fa6736d4cf0cb77481aefc3842e4c2ae"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "46f1768454ec4afbcfae4eda4f2600a61868e61d82a4734450e8aee64d041302"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "dc1587d61bab518de9787016cbde4fc1a5ffb03a1a85ec7fad34b1ddc824b7f4"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "5cee7f382153b125e5cd447c8b81b5d08c0509cd5ac6bf756581da6831a40657"
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
