class Tds < Formula
  desc "Fast TODO comment scanner for your codebase"
  homepage "https://github.com/I-Dieod/TodoScanner"
  url "https://github.com/I-Dieod/TodoScanner/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f2afe11e469036e8af3344e546d85df70fbe6340241c156309b6b904f520befa"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Create a test file with a TODO comment
    (testpath/"test.rs").write <<~EOS
      // TODO: Test comment
      fn main() {}
    EOS

    output = shell_output("#{bin}/tds #{testpath}")
    assert_match "Found 1 TODO items", output
  end
end
