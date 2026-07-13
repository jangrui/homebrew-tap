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

  # std_npm_args 把 npm 装到 #{libexec}/,npm 在 #{libexec}/bin/ 下生成 shim(链到 node_modules 的 .js)。
  # brew 默认不识别 libexec/bin,所以按 Homebrew 官方 Node-for-Formula-Authors 文档显式 glob 一遍
  # 链到 bin/,免维护(以后包新增 bin 不用改公式)。
  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  # 包暴露两个 bin:camofox-browser 和 camofox(见 package.json 的 bin 字段)。
  # camofox-browser 接受 --version/-v,打印 package.json 的 version,适合做 test。
  test do
    assert_match version.to_s, shell_output("#{bin}/camofox-browser --version")
  end
end
