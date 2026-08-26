cask "qoder-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.26.0"

  on_arm do
    sha256 "29876a10d2f826825b14f0441e03fb0fcd7809e3b4a7ebc485f90cd676410676"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "072a8a5ab45a3dcb982985d8a5b841d2568d021e0e760f4f70d694da61fcbae2"

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
