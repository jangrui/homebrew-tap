cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.4.9"
  sha256 arm:   "880e8e5568ab065affbb266f05b7d4f4b0022fc773485701ca92bd03059b9c5b",
         intel: "6d6cb1193a92638009013e16a78d7e1fbb5b73d9c9b1a161d4884315e46cdbc8"

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
