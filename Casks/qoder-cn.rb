cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.4.4"

  on_arm do
    sha256 "7dc2e7ce482edfd933f0e70a3a478209e0d6c058cf1652f613009088223bc4d7"

    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-arm64.zip"
  end
  on_intel do
    sha256 "3c723f530998dcd1f99e92a71702c6afcc2323ea891290a9fc8d830ac1f1bf09"

    url "https://static.qoder.com.cn/qoder-app/releases/#{version}/Qoder-CN-mac-x64.zip"
  end

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
