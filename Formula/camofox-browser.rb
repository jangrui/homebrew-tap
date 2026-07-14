# camofox-browser:面向 AI agent 的反检测浏览器服务器(CLI + REST API)
#
# 上游 https://github.com/redf0x1/camofox-browser 通过 npm 发布,没有二进制 release asset,
# 因此这里用 Homebrew 的 npm 打包惯例(std_npm_args)从 registry 拉 tarball 并安装到独立 prefix。
# 注意:这是纯 JS 包,运行时还需 Camoufox 引擎,首次启动会自动 `camoufox-js fetch`。
class CamofoxBrowser < Formula
  desc "面向 AI agent 的反检测浏览器服务器(Camoufox 引擎,REST API + CLI)"
  homepage "https://github.com/redf0x1/camofox-browser"
  # npm 包名与项目名同名,用 npm registry 作稳定 URL 源。
  url "https://registry.npmjs.org/camofox-browser/-/camofox-browser-2.4.6.tgz"
  # npm registry 的 tarball 地址稳定但无 git tag,用裸 sha256。
  sha256 "49ae10d2d7ad5f65a68acec6f2c3be63a5b11c3208f7b982653a81c954e1157b"
  license "MIT"

  # livecheck:直接查 npm registry 的最新版本。无需 GitHub 认证,也不会被 Linux runner 上的
  # on_intel 问题影响(参考 wps365-cli formula 里为啥不能直接用 url :url)。
  livecheck do
    url "https://registry.npmjs.org/camofox-browser/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  # 上游 engines.node: ">=20" — 兼容 20/22/24/26,按 Homebrew 官方建议跟当前未 deprecated
  # 的 node formula 走(node@20 已标记 2026-10-28 disabled,不绑死具体次版本号)。
  depends_on "node"

  # brew services 支持:camofox-browser 不带参数(或 serve)即前台启动 REST API 服务器,
  # 监听 127.0.0.1:9377(loopback,无需 API key),并处理 SIGTERM 优雅退出 —— 正好适配 launchd。
  # 注意:不能用 #{bin}/camofox-browser 这个 npm shim,它的 shebang 是 #!/usr/bin/env node,
  # launchd 的 PATH 极简找不到 node;这里直接用 node 的 opt 路径跑 server 入口,最稳。
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

  # std_npm_args 把 npm 装到 #{libexec}/,npm 在 #{libexec}/bin/ 下生成 shim(链到 node_modules 的 .js)。
  # brew 默认不识别 libexec/bin,所以按 Homebrew 官方 Node-for-Formula-Authors 文档显式 glob 一遍
  # 链到 bin/,免维护(以后包新增 bin 不用改公式)。
  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")

    # 删掉当前 OS 下非 native 架构的 native module prebuild(argon2 等包会把所有架构 .node 都打进
    # tarball,但运行时只会加载匹配本机架构的那个,删掉冗余的不影响功能)。
    # 用 Hardware::CPU.arch 动态判断,确保 Intel 用户装时删 darwin-arm64、ARM 用户装时删 darwin-x64,
    # 公式通用不绑死架构。这样 brew audit 的
    # "Binaries built for a non-native architecture" 也会消失。
    return unless OS.mac?

    arch = Hardware::CPU.arch
    Dir.glob(libexec/"lib/node_modules/**/prebuilds/darwin-*").each do |dir|
      # 保留 native arch 的 prebuild,删掉其它 darwin-* arch 的 prebuild
      next if dir.end_with?(arch.to_s)

      rm_r dir
    end
  end

  # 包暴露两个 bin:camofox-browser 和 camofox(见 package.json 的 bin 字段)。
  # camofox-browser 接受 --version/-v,打印 package.json 的 version,适合做 test。
  test do
    assert_match version.to_s, shell_output("#{bin}/camofox-browser --version")
  end
end
