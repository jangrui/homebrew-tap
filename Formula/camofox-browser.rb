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
    # node-gyp 会把 python 解释器路径原样写进生成的 Makefile;用户 PATH 里若混入
    # 含空格的 python(如 ~/Library/Application Support/... 下的 IDE 内置 python),
    # make 会因路径在空格处截断报 Error 127,better-sqlite3 编译静默失败。
    # 固定用 CLT 自带的 python3,保证任何用户环境下都能编译成功。
    ENV["PYTHON"] = "/usr/bin/python3"
    ENV["npm_config_python"] = "/usr/bin/python3"

    # std_npm_args 默认 ignore_scripts: true,会跳过 better-sqlite3/argon2 的原生编译
    # 和 camoufox-js 的浏览器 fetch,必须显式放开,否则装完缺 .node 绑定和浏览器二进制
    system "npm", "install", *std_npm_args(ignore_scripts: false)
    bin.install_symlink libexec.glob("bin/*")

    return unless OS.mac?

    arch = Hardware::CPU.arch
    Dir.glob(libexec/"lib/node_modules/**/prebuilds/darwin-*").each do |dir|
      next if File.basename(dir).end_with?(arch.to_s)

      rm_r dir
    end
  end

  def post_install
    return unless OS.mac?

    node = formula_opt_bin("node")/"node"
    pkg = libexec/"lib/node_modules/camofox-browser"

    # better-sqlite3 原生绑定 ABI 校验:编译用的 node 必须等于运行时的 node,
    # 否则 service 一启动就 NODE_MODULE_VERSION 报错
    binding_check = "new (require('#{pkg}/node_modules/better-sqlite3'))(':memory:')" \
                    ".exec('create table t(a)')"
    out, status = Open3.capture2e(node.to_s, "-e", binding_check)
    odie "better-sqlite3 原生绑定加载失败,请确认 CLT 正常(xcode-select -p)后 reinstall。\n#{out}" unless status.success?

    # npm postinstall 是 `npx camoufox-js fetch || true`,GitHub 拉取失败会被静默吞掉;
    # 且 brew install/post_install 阶段 HOME 是临时目录,而浏览器缓存固定在真实用户的
    # ~/Library/Caches/camoufox(camoufox-js 不会在启动时自动补拉,缺失即报
    # CamoufoxNotInstalled)。这里用真实 HOME 显式校验 + 兜底重拉,
    # 保证 install 完成时浏览器二进制一定就位
    real_home = Pathname.new(Etc.getpwuid.dir)
    cache = real_home/"Library/Caches/camoufox"
    fetched = (cache/"version.json").exist? && (cache/"Camoufox.app/Contents/MacOS/camoufox").exist?
    2.times do
      break if fetched

      system({ "HOME" => real_home.to_s }, node.to_s,
             (pkg/"node_modules/camoufox-js/dist/__main__.js").to_s, "fetch")
      fetched = (cache/"version.json").exist?
      sleep 5 unless fetched
    end
    return if fetched

    odie <<~EOS
      Camoufox 浏览器二进制下载失败(需要能访问 github.com/daijro/camoufox/releases)。
      检查网络/代理后手动补拉,再 brew services restart camofox-browser:
        #{node} #{pkg}/node_modules/camoufox-js/dist/__main__.js fetch
    EOS
  end

  def caveats
    <<~EOS
      启动服务:brew services start camofox-browser
      REST API 默认监听 http://localhost:9377(/health 健康检查)。
      浏览器二进制在 ~/Library/Caches/camoufox,损坏时删掉该目录后 reinstall 会自动补拉。
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/camofox-browser --version")
  end
end
