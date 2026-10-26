class Runa < Formula
  desc "Fast and lightweight terminal file manager written in Rust"
  homepage "https://github.com/runa-fm/runa"
  version "0.15.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "41097ffc5a70e8a0a94977897832ccb49488765cf03fce337d5077952ad6de68"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "2b619e868ccdc07663eb87ae663ce6fcdb0d021fb6c8765480b602b19cb712a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "0cef6c94b13ca39469c6dc933ee0fd0e9a5162023c0e7be0274be70acb6f12c7"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "cffa32221aeb2abd26813dff3a87a13fa1847228e1d77c58ed9fc8c252892fc3"
    end
  end

  def install
    bin.install "rn"

    doc.install "LICENSE-MIT" if File.exist? "LICENSE-MIT"
    doc.install "LICENSE-APACHE" if File.exist? "LICENSE-APACHE"
    doc.install "README.md" if File.exist? "README.md"
    doc.install "docs/configuration.md" if File.exist? "docs/configuration.md"
    doc.install "docs/config-reference" if File.directory? "docs/config-reference"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/rn --help")
    assert_match version.to_s, shell_output("#{bin}/rn --version")
  end
end
