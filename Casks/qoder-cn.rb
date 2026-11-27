cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.5.20"
  sha256 arm:   "f38904bbada40427cc67a3efc3b5ce388ab8e150a90e0276c371fe41ceb93e9c",
         intel: "9d680634c692994805b8314b88cc17886aedfe357c27958dfd598bef195b0430"

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
