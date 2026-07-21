class CamofoxBrowser < Formula
  desc "面向 AI agent 的反检测浏览器服务器(Camoufox 引擎,REST API + CLI)"
  homepage "https://github.com/redf0x1/camofox-browser"
  url "https://registry.npmjs.org/camofox-browser/-/camofox-browser-2.4.6.tgz"
  sha256 "49ae10d2d7ad5f65a68acec6f2c3be63a5b11c3208f7b982653a81c954e1157b"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/camofox-browser/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"

  service do
    run [formula_opt_bin("node")/"node",
         opt_libexec/"lib/node_modules/camofox-browser/dist/src/server.js"]
    keep_alive true
    working_dir var
    environment_variables(
      PATH: "#{HOMEBREW_PREFIX}/opt/node/bin:#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:/usr/bin:/bin",
    )
    log_path var/"log/camofox-browser.log"
    error_log_path var/"log/camofox-browser.log"
  end

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")

    return unless OS.mac?

    arch = Hardware::CPU.arch
    Dir.glob(libexec/"lib/node_modules/**/prebuilds/darwin-*").each do |dir|
      next if File.basename(dir).end_with?(arch.to_s)

      rm_r dir
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/camofox-browser --version")
  end
end
