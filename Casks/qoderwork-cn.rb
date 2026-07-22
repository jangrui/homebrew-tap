cask "qoderwork-cn" do
  arch arm: "arm64", intel: "x64"

  version :latest
  sha256 :no_check

  on_arm do
    url "https://static.qoder.com.cn/qoder-work-cn/releases/latest/QoderWorkCN-arm64.dmg"
  end
  on_intel do
    url "https://static.qoder.com.cn/qoder-work-cn/releases/latest/QoderWorkCN-x64.dmg"
  end

  name "QoderWork CN"
  desc "本地运行、自主规划、安全可控的 AI 工作搭子"
  homepage "https://qoder.com.cn/"

  # 上游只提供 releases/latest 固定链接(版本化路径 403),无法 livecheck
  livecheck do
    skip "Upstream only publishes a latest/ URL"
  end

  depends_on macos: :big_sur

  app "QoderWork CN.app"

  zap trash: [
    "~/Library/Application Support/QoderWork CN",
    "~/Library/Caches/com.qoder.work.cn",
    "~/Library/Caches/com.qoder.work.cn.ShipIt",
    "~/Library/HTTPStorages/com.qoder.work.cn",
    "~/Library/Preferences/com.qoder.work.cn.plist",
  ]
end
