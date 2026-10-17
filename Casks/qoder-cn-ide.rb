cask "qoder-cn-ide" do
  arch arm: "arm64", intel: "x64"

  version "1.34.0"
  sha256 arm:   "3d036062ce392eac48c48a1c539a31f8188cf44abcac94e616575fdb9b9546ce",
         intel: "7bcbaf96af7db132bde9396174c17a1162a2726ebda19bd66c9e26bada46421d"

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
