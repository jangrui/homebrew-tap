cask "recordly" do
  version "1.4.0"

  on_arm do
    sha256 "520ee1d5570f2342e126306eda84b95e442c844b6f0e84c6e81c208445be8cc4"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-arm64.dmg"
  end
  on_intel do
    sha256 "f478afef1c37adb8d4df9e0c0cdecde99df6f3131e34629ad3f5c3c8c226d1b5"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-x64.dmg"
  end

  name "Recordly"
  desc "面向创作者的屏幕录制工具,自动缩放、光标特效、背景与标注,免剪辑直出成品视频"
  homepage "https://recordly.dev/"

  livecheck do
    url :url
    strategy :github_releases
  end

  auto_updates true
  depends_on macos: :monterey

  app "Recordly.app"

  uninstall quit: "dev.recordly.app"

  zap trash: [
    "~/Library/Application Support/Recordly",
    "~/Library/Caches/dev.recordly.app",
    "~/Library/Caches/dev.recordly.app.ShipIt",
    "~/Library/Caches/Recordly",
    "~/Library/HTTPStorages/dev.recordly.app",
    "~/Library/Logs/Recordly",
    "~/Library/Preferences/dev.recordly.app.plist",
    "~/Library/Saved Application State/dev.recordly.app.savedState",
    "~/Library/WebKit/dev.recordly.app",
  ]
end
