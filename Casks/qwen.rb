cask "qwen" do
  version "1.0.2.6"

  on_arm do
    sha256 "dc55f90cb8ad04e0d1d6f2f1e58939512615ad143bb3402eeaed929dc6a4f0fd"

    url "https://download.qwen.ai/macos/arm64/Qwen-#{version}-release-mac-arm64.dmg"
  end
  on_intel do
    sha256 "91360d2c7381346a94db3f9d2dc34a26c640d0de4146be894e00f20df9b8893f"

    url "https://download.qwen.ai/macos/x64/Qwen-#{version}-release-mac-x64.dmg"
  end

  name "Qwen"
  desc "Alibaba 的 Qwen(通义千问)国际版桌面端,Qwen Studio 多模态 AI 助手"
  homepage "https://qwen.ai/"

  # livecheck:用 app 内嵌的 electron-updater feed。
  # 上游真正的 feed URL 写死在 main process(initializeAutoUpdater),
  # 是 https://download.qwen.ai/macos/{arm64,x64}/latest-mac.yml,
  # 不是 app-update.yml 里那个 cdnwl.qwenlm.ai 占位符。
  # 用 :electron_builder 策略直接解 yaml 取 version。
  #
  # 注意:1.0.5 起 dmg 文件名变成 Qwen-{version}.{build}.dmg 含 build 号,
  # 不可从 version 推导 —— bump-cask-pr 会拿到错的 url,sha256 也算不出,
  # 所以 bump 阶段仍需手维护 dmg url + sha256。但 livecheck 至少能扫到新版。
  livecheck do
    url "https://download.qwen.ai/macos/arm64/latest-mac.yml"
    strategy :electron_builder
  end

  # App 的 Info.plist LSMinimumSystemVersion = 11.0(Big Sur)。
  depends_on macos: :big_sur

  app "Qwen.app"

  zap trash: [
    "~/Library/Application Support/Qwen",
    "~/Library/Caches/Qwen",
    "~/Library/Logs/Qwen",
    "~/Library/Preferences/com.qwen.chat.plist",
  ]
end
