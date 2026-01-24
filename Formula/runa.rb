class Runa < Formula
  desc "Fast and lightweight terminal file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  version "0.5.7"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "4ca19f72e50ab46f7400dd5b5da9310ad776682aeefe73327a0d6eb4448f64c8"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "4a0381b3d51393fa16b6cb89ab0b8d820abe4111e2bea275922b94c6fabc3b57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-aarch64.tar.gz"
      sha256 "ecf6af2ff80df98d3b53cdc86a4a04e5519a32005845092b7ff62f93751e9a15"
    else
      url "https://github.com/alexm-dev/runa/releases/download/v#{version}/runa-linux-x86_64.tar.gz"
      sha256 "bdf4f8a4166f37d6070047fa2a9305b28dce8141d329f70442d2a83f9268becd"
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
