cask "qoder-cn-ide" do
  arch arm: "arm64", intel: "x64"

  version "1.39.0"
  sha256 arm:   "ae1b9ddbc1a13b892c442173635c6a7459d65a9d4f92c37efa801ef179964f9f",
         intel: "944882ec290ca209c33cefaad2782247ea195dd4254ff69ead38f8676d193263"

  url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-#{arch}.dmg"
  name "Qoder CN IDE"
  desc "为真实软件开发打造的智能体自主开发工作台"
  homepage "https://qoder.com.cn/"

  livecheck do
    url "https://docs.qoder.cn/product-overview/qoder-cn-ide-update-log.md"
    strategy :page_match
    regex(/\A.*?v?(\d+(?:\.\d+)+)/im)
  end

  auto_updates true
  depends_on macos: :monterey

  app "Qoder CN IDE.app"

  uninstall quit: "com.aliyun.lingma.ide"

  zap trash: [
    "~/Library/Application Support/Qoder CN",
    "~/Library/Caches/com.aliyun.lingma.ide",
    "~/Library/Caches/com.aliyun.lingma.ide.ShipIt",
    "~/Library/HTTPStorages/com.aliyun.lingma.ide",
    "~/Library/Preferences/com.aliyun.lingma.ide.plist",
  ]
end
