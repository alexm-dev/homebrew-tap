class Runa < Formula
  desc "Fast and lightweight console file browser written in Rust"
  homepage "https://github.com/alexm-dev/runa"
  url "https://github.com/alexm-dev/runa/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "4afe8a0b86e5484fcbf02c03788f50a0b7b25ddf4376b51fc7eab05907b3d20b"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    doc.install "README.md", "docs/configuration.md"
  end

  test do
    assert_predicate bin/"rn", :exist?
    assert_predicate bin/"rn", :executable?
    assert_match "Usage", shell_output("#{bin}/rn --help")
  end
end
