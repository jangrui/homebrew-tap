cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.8.0"

  on_arm do
    sha256 "cb40468ba6db4597618911a01a9e67763bb0786f46e8b832765d7f670db6567c"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/QoderCN-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "ebb422e5758639ddc0d8aff074c620da8806ad190066990c1da7a4e936cf8663"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/QoderCN-darwin-x64.dmg"
  end

  name "Qoder CN"
  desc "为真实软件开发打造的智能体自主开发工作台"
  homepage "https://qoder.com.cn/"

  # 更新日志页混排 IDE/JetBrains/VS 多条产品线,JetBrains 版本号(3.x)比 IDE(1.x)高,
  # livecheck 取所有匹配中的最大值,所以用 \A 锚定 + 懒惰匹配只取页面第一个版本号(IDE 最新版)
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
