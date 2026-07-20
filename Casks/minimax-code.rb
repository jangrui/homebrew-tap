# minimax-code:MiniMax Agent 桌面端(代号 MiniMax Code)
#
# 上游 https://github.com/MiniMax-AI/minimax-code 是 issue tracker,不发 release;
# dmg 通过 https://agent.minimaxi.com/download 分发,3.0.51 起只发 arm64 dmg
# (zip 里 Electron Framework 是 lipo Non-fat arm64,无 x86_64 slice)。
#
# dmg 实际托管在 filecdn.minimax.chat 公开 OSS 的 minimax-agent-prod bucket,
# 内容由 app 自带 Squirrel.Mac + electron-updater generic provider 拉取
# (app-update.yml 写 url: .../release,会在 release/ 下取 latest-mac.yml)。
# livecheck 也直接读这个 latest-mac.yml —— 由上游发布流水线写,比 changelog.md 及时
# (changelog 是事后补文档,几版之后才追上,实测滞后 > 1 个版本)。
#
# 这条 cask 因此存在两个局限:
#   1. livecheck 只比对版本号,不校验 dmg 可用性 —— bump 阶段需手维护 url + sha256
#   2. x64 dmg 上游根本不发,Intel 用户 brew install 会报 "not supported on Intel"
#      (depends_on arch: :arm64 触发,brew cask DSL 数组里用 :arm64/:x86_64,不用 :arm)
cask "minimax-code" do
  version "3.0.52"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  url "https://filecdn.minimax.chat/public/minimax-agent-prod/release/MiniMax Code-3.0.52-arm64.dmg",
      verified: "filecdn.minimax.chat/public/minimax-agent-prod/"
  name "MiniMax Code"
  desc "MiniMax Agent 桌面端,多 Agent 协作 + 工作区文件批量处理 + 浏览器自动化"
  homepage "https://agent.minimaxi.com/"

  # 直接读 OSS 上的 latest-mac.yml —— 这是 electron-updater 的 appcast,发布流水线写,
  # 比 changelog.md 及时(实测 changelog 滞后 > 1 版)。brew 内置 :electron_builder strategy
  # 默认从 yaml["version"] 取,正好对上 `version: X.Y.Z` 这一行。
  livecheck do
    url "https://filecdn.minimax.chat/public/minimax-agent-prod/release/latest-mac.yml"
    strategy :electron_builder
  end

  # arm64-only 上游策略:Intel Mac 不发包,brew 原生报 "not supported on Intel"。
  # cask DSL 用 :arm64/:x86_64(带 bits),不是 formula 的 :arm/:intel(抽象架构)。
  depends_on arch: :arm64
  # App 的 LSMinimumSystemVersion = 12.0(Monterey)。
  depends_on macos: :monterey

  app "MiniMax Code.app"

  # 留空时 brew 默认不删 user data,跟 qwen.rb / zcode.rb 习惯保持一致 —— 用户重装或迁移时
  # 还能保留登录态和工作区。需要"彻底卸载"时让用户单独跑 rm -rf 这几行即可。
  zap trash: [
    "~/Library/Application Support/MiniMax",
    "~/Library/Caches/@mmx-agentelectron-updater",
    "~/Library/Caches/com.minimax.agent.cn.ShipIt",
    "~/Library/HTTPStorages/com.minimax.agent.cn",
    "~/Library/Preferences/com.minimax.agent.cn.plist",
  ]
end
