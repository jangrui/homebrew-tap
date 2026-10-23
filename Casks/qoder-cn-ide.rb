cask "qoder-cn-ide" do
  arch arm: "arm64", intel: "x64"

  version "1.36.0"
  sha256 arm:   "b279c374050b2b4801b33475b763977e3adb94b080558a8485b120b28dfa3d5b",
         intel: "e76d3a0b30a99a69fe9b92bb0e049123acd7c2918ba292fd96994edfbb9ac536"

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
