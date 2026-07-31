cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.9.0"

  on_arm do
    sha256 "388034701685dacd5cefba1321ed6aed4823d6b06af58eda232b130aa9dba3ab"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/QoderCN-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "5fc03196730b03ca837b800e10162dbe8fa06b5c998e47ed05474c2ecb9b260e"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/QoderCN-darwin-x64.dmg"
  end

  name "Qoder CN"
  desc "为真实软件开发打造的智能体自主开发工作台"
  homepage "https://qoder.com.cn/"

  livecheck do
    url "https://docs.qoder.cn/product-overview/qoder-cn-update-log"
    strategy :page_match
    regex(/\A.*?v?(\d+(?:\.\d+)+)\s*\(\d{4}-\d{2}-\d{2}\)/im)
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
