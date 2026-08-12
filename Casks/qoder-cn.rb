cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.23.0"

  on_arm do
    sha256 "2d1deb5e06316532b3395c3c906e1a6c4d08954d72a01c6f03e0ff26d75c1c4f"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/QoderCN-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "d07beca8ffd26a4bce65e366c351b445397cef60153efcde483d1bdaaef37488"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/QoderCN-darwin-x64.dmg"
  end

  name "Qoder CN"
  desc "为真实软件开发打造的智能体自主开发工作台"
  homepage "https://qoder.com.cn/"

  livecheck do
    url "https://docs.qoder.cn/product-overview/qoder-cn-update-log.md"
    strategy :page_match
    regex(/\A.*?v?(\d+(?:\.\d+)+)/im)
  end

  depends_on macos: :monterey

  app "Qoder CN.app"

  zap trash: [
    "~/Library/Application Support/Qoder CN",
    "~/Library/Caches/com.aliyun.lingma.ide",
    "~/Library/Caches/com.aliyun.lingma.ide.ShipIt",
    "~/Library/HTTPStorages/com.aliyun.lingma.ide",
    "~/Library/Preferences/com.aliyun.lingma.ide.plist",
  ]
end
