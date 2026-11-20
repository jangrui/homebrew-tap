cask "qoderwork-cn" do
  arch arm: "arm64", intel: "x64"

  version "0.9.18"
  sha256 arm:   "fa9fe77c72ef06a0d0f31e2e5bfad9a0fd8c1ff824a3330f74901d700c53a464",
         intel: "0dd048a6b41d447022d8f9aaf39c9bfa431b4d98c63efa7762381505eb740be3"

  url "https://static.qoder.com.cn/qoder-work-cn/releases/latest/QoderWorkCN-#{arch}.dmg"
  name "QoderWork CN"
  desc "本地运行、自主规划、安全可控的 AI 工作搭子"
  homepage "https://qoder.com.cn/"

  # 固定地址(latest/),版本号来自 electron-builder 的 latest-mac.yml
  livecheck do
    url "https://static.qoder.com.cn/qoder-work-cn/releases/latest-mac.yml"
    strategy :page_match
    regex(/^version:\s*v?(\d+(?:\.\d+)+)\s*$/i)
  end

  depends_on :macos

  app "QoderWork CN.app"

  uninstall quit: "com.qoder.work.cn"

  zap trash: [
    "~/Library/Application Support/QoderWork CN",
    "~/Library/Caches/com.qoder.work.cn",
    "~/Library/Caches/com.qoder.work.cn.ShipIt",
    "~/Library/HTTPStorages/com.qoder.work.cn",
    "~/Library/Preferences/com.qoder.work.cn.plist",
  ]
end
