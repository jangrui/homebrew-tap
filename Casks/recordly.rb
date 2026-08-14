cask "recordly" do
  version "1.3.3"

  on_arm do
    sha256 "7fa8f4116e870d40fd78bb36d2ad20af364c945023b7b5ec3e72b568b6bbdee5"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-arm64.dmg"
  end
  on_intel do
    sha256 "35e49a0bf7afbca771b12fc99a834a287cbcb2e47bc9be07c4e56cbdd2923f85"

    url "https://github.com/webadderallorg/Recordly/releases/download/v#{version}/Recordly-x64.dmg"
  end

  name "Recordly"
  desc "面向创作者的屏幕录制工具,自动缩放、光标特效、背景与标注,免剪辑直出成品视频"
  homepage "https://recordly.dev/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :monterey

  app "Recordly.app"

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
