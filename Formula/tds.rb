class Tds < Formula
  desc "Fast TODO comment scanner for your codebase"
  homepage "https://github.com/I-Dieod/TodoScanner"
  url "https://github.com/YOUR_USERNAME/TodoScanner/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5ba82770b3414f72aaa355ff3f8f47c9c469fa9e18ae44a2902b9a4470d6eadd"
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
    
    output = shell_output("#{bin}/TodoScanner #{testpath}")
    assert_match "Found 1 TODO items", output
  end
end
