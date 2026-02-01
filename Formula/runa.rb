class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  version "0.6.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "a3b8388f5772e6a7a528258b3e39dc03b53e95280a938a74204b610ea5d4cc7e"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "c6becbe471453f4e06ca26e4ce2306c152b5be61a5b55992847fab25c6a9b5ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-aarch64.tar.gz"
      sha256 "7ffb82cff11920794d620e7a6d3d2b723ad23030e58a3dd2488bc61b36ad685c"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-x86_64.tar.gz"
      sha256 "6233a158ca4909b6af9fc360df5fa7f02b6d05ee4451ab8920dc793a409b94e8"
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
