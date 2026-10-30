cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.5.1"
  sha256 arm:   "ff09a8565a1fda3c8b41628ce8a5f545a20ce5c4b15d35b6ca09d9a7a6d192e0",
         intel: "5c672358c9166ee990f7e8d3fa1a1c9611875587e0aac7ce7d1e80319b333c0e"

  url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-#{arch}.zip"
  name "Qoder CN"
  desc "阿里云以编程智能体为核心的智能体工作空间"
  homepage "https://qoder.cn/"

  livecheck do
    url "https://static.qoder.com.cn/qoder-app/releases/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: :monterey

  app "Qoder CN.app"

  uninstall quit: "com.qodercn.app"

  zap trash: [
    "~/Library/Application Support/com.qodercn.app.stable",
    "~/Library/Application Support/QoderCN",
    "~/Library/Caches/com.qodercn.app",
    "~/Library/Caches/com.qodercn.app.ShipIt",
    "~/Library/Caches/qoder-cn-updater",
    "~/Library/HTTPStorages/com.qodercn.app",
    "~/Library/Preferences/com.qodercn.app.plist",
    "~/Library/Saved Application State/com.qodercn.app.savedState",
    "~/Library/WebKit/com.qodercn.app",
  ]
end
