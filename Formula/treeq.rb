class Treeq < Formula
  desc "Keyboard-driven tree view for JSON and XML, in your terminal"
  homepage "https://github.com/ognjen-vuceljic/treeq"
  url "https://github.com/ognjen-vuceljic/treeq/archive/refs/tags/v0.13.3.tar.gz"
  sha256 "3acd313efc7211a7d9fa9ae9f44c894e95c746dcf33ba86c38ae44ec8e78b291"
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
