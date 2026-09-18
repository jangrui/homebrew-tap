class CamofoxBrowser < Formula
  desc "面向 AI agent 的反检测浏览器服务器(Camoufox 引擎,REST API + CLI)"
  homepage "https://github.com/redf0x1/camofox-browser"
  url "https://registry.npmjs.org/camofox-browser/-/camofox-browser-2.4.7.tgz"
  sha256 "fe8505ec4f091ceaec3e4406be9d1104970bdaeafd83875d4114a0f1ab70b970"
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
    ENV["PYTHON"] = "/usr/bin/python3"
    ENV["npm_config_python"] = "/usr/bin/python3"

    system "npm", "install", *std_npm_args(ignore_scripts: false).reject { |arg| arg == "--build-from-source" }
    bin.install_symlink libexec.glob("bin/*")

    return unless OS.mac?

    arch = Hardware::CPU.arch
    arch = :x64 if arch == :x86_64
    Dir.glob(libexec/"lib/node_modules/**/prebuilds/darwin-*").each do |dir|
      next if File.basename(dir).end_with?(arch.to_s)

      rm_r dir
    end

    node = formula_opt_bin("node")/"node"
    pkg = libexec/"lib/node_modules/camofox-browser"
    binding_check = "new (require('#{pkg}/node_modules/better-sqlite3'))(':memory:')" \
                    ".exec('create table t(a)')"
    out, status = Open3.capture2e(node.to_s, "-e", binding_check)
    odie "better-sqlite3 原生绑定加载失败,请确认 CLT 正常(xcode-select -p)后 reinstall。\n#{out}" unless status.success?
  end

  post_install_steps do
    on_macos do
      unless_path_exists "/Users/{{user}}/Library/Caches/camoufox/version.json" do
        warn "Camoufox 浏览器二进制缺失,brew 安装沙箱不允许写 ~/Library/Caches/camoufox;" \
             "请手动补拉(需访问 github.com/daijro/camoufox/releases)后 brew services restart camofox-browser:" \
             "\n  {{HOMEBREW_PREFIX}}/opt/node/bin/node " \
             "{{libexec}}/lib/node_modules/camofox-browser/node_modules/camoufox-js/dist/__main__.js fetch"
      end
    end
  end

  def caveats
    <<~EOS
      启动服务:brew services start camofox-browser
      REST API 默认监听 http://localhost:9377(/health 健康检查)。
      浏览器二进制在 ~/Library/Caches/camoufox,brew 安装沙箱不允许写该目录;缺失或损坏时手动补拉:
        #{HOMEBREW_PREFIX}/opt/node/bin/node #{opt_libexec}/lib/node_modules/camofox-browser/node_modules/camoufox-js/dist/__main__.js fetch
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/camofox-browser --version")
  end
end
