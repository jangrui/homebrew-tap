cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.25.1"

  on_arm do
    sha256 "81984953efaf433af1209852d8576b78078e4d74a197f426acb1cb62f366bbca"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "759a2e96018d95c500afba7416c5a95af99acf8d66c97bd941a13b9f27d50a34"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-x64.dmg"
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
