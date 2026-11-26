class Treeq < Formula
  desc "Keyboard-driven tree view for JSON and XML, in your terminal"
  homepage "https://github.com/ognjen-vuceljic/treeq"
  url "https://github.com/ognjen-vuceljic/treeq/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "228cfa2d3533391f65562d3c02ea5a97289dd67d8e4cc3e6d44816776fe47daf"
  license "MIT"
  head "https://github.com/ognjen-vuceljic/treeq.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "treeq #{version}", shell_output("#{bin}/treeq --version")

    (testpath/"sample.json").write('{"name": "Alice"}')
    output = shell_output("#{bin}/treeq --static #{testpath}/sample.json")
    assert_match "name: \"Alice\"", output
  end
end
