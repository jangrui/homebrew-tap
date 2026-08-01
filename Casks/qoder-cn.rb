cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.9.1"

  on_arm do
    sha256 "5ea2c83d3f8ff76cfe8bf4c41753f1a8a39b5bed8504254f51730a92ac841057"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/QoderCN-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "75e69e8517090d7e4a203fac7e570d6c88daf4ae22bda3293fcd5089a9f73dfb"

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
