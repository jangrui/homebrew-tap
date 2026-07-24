cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.8.1"

  on_arm do
    sha256 "e68f80352457ac0f1342187e1600b1a75b60406571c3ac042c400fa1cfe30a32"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/QoderCN-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "e8560722f12c529fd766effcb9127d60b89863a16a11410fbb6197288c864de9"

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
