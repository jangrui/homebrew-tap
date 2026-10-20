cask "qoder-cn-ide" do
  arch arm: "arm64", intel: "x64"

  version "1.35.0"
  sha256 arm:   "bdd4d481a61a7c0e0e5b67f2e6e06931ab20908ac69c38d8db9f527d5ecfee82",
         intel: "5b670dc827ceaad0457b4b68fe4a7439cfc5541b56e7f738a182ca90aae26430"

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
