class Treeq < Formula
  desc "Keyboard-driven tree view for JSON and XML, in your terminal"
  homepage "https://github.com/ognjen-vuceljic/treeq"
  url "https://github.com/ognjen-vuceljic/treeq/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "18d5a289fb7cdfbaadfce950123e8f56e5aadf0ec68e8033110e36ced57f175f"
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
