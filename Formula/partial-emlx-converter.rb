require "language/node"

class PartialEmlxConverter < Formula
  desc "Convert .emlx and .partial.emlx files created by Apple’s Mail.app to .eml"
  homepage "https://github.com/qqilihq/partial-emlx-converter#readme"
  url "https://registry.npmjs.org/partial-emlx-converter/-/partial-emlx-converter-3.0.4.tgz"
  sha256 "646e01e64b94e859dd05544362668432984f246b96a1b4b584b0549dda464281"
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
