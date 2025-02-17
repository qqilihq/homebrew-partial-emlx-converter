require "language/node"

class PartialEmlxConverter < Formula
  desc "Convert .emlx and .partial.emlx files created by Apple’s Mail.app to .eml"
  homepage "https://github.com/qqilihq/partial-emlx-converter#readme"
  url "https://registry.npmjs.org/partial-emlx-converter/-/partial-emlx-converter-3.1.0.tgz"
  sha256 "89b76cfd6b110ee044627c01c6a716948502920fdf0580b377f8dbb630ce2dfc"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # expect exit code 1
    output = shell_output("#{bin}/partial-emlx-converter", 1).strip
    expected = "error: missing required argument 'input_directory'"
    assert_equal expected, output
  end
end
