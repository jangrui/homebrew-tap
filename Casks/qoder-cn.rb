cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.31.0"

  on_arm do
    sha256 "6909b2a41ca412b01b68fc767d952f2f93df2c700c5a4320533c39c9553996b9"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "8e9c745dbd9c7de620e6ec7a5cf82a7650ce076f827ac1d2a5cc543f13b89ae5"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-x64.dmg"
  end

  name "Qoder CN"
  desc "为真实软件开发打造的智能体自主开发工作台"
  homepage "https://qoder.com.cn/"

  livecheck do
    url "https://docs.qoder.cn/product-overview/qoder-cn-ide-update-log.md"
    strategy :page_match
    regex(/\A.*?v?(\d+(?:\.\d+)+)/im)
  end

  auto_updates true
  depends_on macos: :monterey

  app "Qoder CN.app"

  uninstall quit: "com.aliyun.lingma.ide"

  zap trash: [
    "~/Library/Application Support/Qoder CN",
    "~/Library/Caches/com.aliyun.lingma.ide",
    "~/Library/Caches/com.aliyun.lingma.ide.ShipIt",
    "~/Library/HTTPStorages/com.aliyun.lingma.ide",
    "~/Library/Preferences/com.aliyun.lingma.ide.plist",
  ]
end
