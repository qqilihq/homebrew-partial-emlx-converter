require "language/node"

class PartialEmlxConverter < Formula
  desc "Convert .emlx and .partial.emlx files created by Apple’s Mail.app to .eml"
  homepage "https://github.com/qqilihq/partial-emlx-converter#readme"
  url "https://registry.npmjs.org/partial-emlx-converter/-/partial-emlx-converter-3.0.3.tgz"
  sha256 "ffb533b83bd8657e989b687a8694dfceee298de6d2cfcb6f51a233564c0d3c1d"
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
    expected = "partial-emlx-converter input_directory output_directory [--ignoreErrors]"
    assert_equal expected, output
  end
end
