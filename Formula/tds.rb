class Tds < Formula
  desc "Fast TODO comment scanner for your codebase"
  homepage "https://github.com/I-Dieod/TodoScanner"
  url "https://github.com/I-Dieod/TodoScanner/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "71884c2a321ce176e6252ddce61421e81e277ebca364a964b97680c3181894d3"
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
