cask "zcode" do
  arch arm: "arm64", intel: "x64"

  version "3.4.0"

  on_arm do
    sha256 "7a748829dbdd2b576c4acdc9bf8c8536431e9b38d0fa624f32f75ccd47cc9cde"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/macos-arm64/ZCode-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "a83c33de1088c0b89b00f369a9733c13ac22d84d54bc34618d18b02e3091a9f7"

    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/macos-x64/ZCode-#{version}-mac-x64.dmg"
  end

  name "ZCode"
  desc "Z.ai 的 Agentic Development Environment,内置 GLM-5.2 coding agent"
  homepage "https://zcode.z.ai/"

  # livecheck: 上游 zcode.z.ai/api/v1/releases/electron/manifest?channel=3 (preview)
  # 返回标准 electron-builder yaml,但形态是每 platform 一份 yaml,不利于 brew livecheck
  # 直接消费。所以走"自建代理 feed"模式:
  #   1. feed-zcode.yml 每天把两份 manifest 合并成 feeds/zcode/latest-mac.yml,推到 main
  #   2. 这里 livecheck 指 raw GitHub 的这份 yaml,brew livecheck :electron_builder
  #      读 yaml["version"] 拿到 preview 流最新版本号
  # 选 channel=3 (preview) 是因为 stable 流在客户端侧滞后于 preview;详细取舍见
  # README 的 livecheck 策略表。
  livecheck do
    url "https://raw.githubusercontent.com/jangrui/homebrew-tap/main/feeds/zcode/latest-mac.yml"
    strategy :electron_builder
  end

  # App 的 LSMinimumSystemVersion = 12.0
  depends_on macos: :monterey

  app "ZCode.app"

  zap trash: [
    "~/Library/Application Support/ZCode",
    "~/Library/Caches/@zcodedesktop-updater",
    "~/Library/Caches/dev.zcode.app",
    "~/Library/Caches/dev.zcode.app.ShipIt",
    "~/Library/HTTPStorages/dev.zcode.app",
    "~/Library/Preferences/dev.zcode.app.plist",
  ]
end
