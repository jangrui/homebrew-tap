cask "qoder-cn-ide" do
  arch arm: "arm64", intel: "x64"

  version "1.38.0"
  sha256 arm:   "e39cbe2fad675efac30d6cb64d8af51d0f328d07d0aa18d74cd5980756b9de06",
         intel: "7a9d98fda9eebe00e7c906ab64b915eab7ecd61d13e3f42d09ff738b44420e40"

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
