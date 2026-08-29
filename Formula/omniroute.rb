class Omniroute < Formula
  desc "统一 AI 网关,聚合 160+ 提供商到单一 OpenAI 兼容端点(自动回退 + Token 压缩 + MCP/A2A)"
  homepage "https://github.com/diegosouzapw/OmniRoute"
  url "https://registry.npmjs.org/omniroute/-/omniroute-3.8.50.tgz"
  sha256 "738c58af1faae8c57eb643a939d1191f8d7e083d9295ef61687d2bff04878c29"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/omniroute/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"

  def install
    ENV["PYTHON"] = "/usr/bin/python3"
    ENV["npm_config_python"] = "/usr/bin/python3"

    system "npm", "install", *std_npm_args(ignore_scripts: false)
    bin.install_symlink libexec.glob("bin/*")

    return unless OS.mac?

    arch = Hardware::CPU.arch
    arch = :x64 if arch == :x86_64
    Dir.glob(libexec/"lib/node_modules/**/prebuilds/darwin-*").each do |dir|
      next if File.basename(dir).end_with?(arch.to_s)

      rm_r dir
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omniroute --version")
  end
end
