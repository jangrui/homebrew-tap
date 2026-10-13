cask "qoder-cn-ide" do
  arch arm: "arm64", intel: "x64"

  version "1.33.0"

  on_arm do
    sha256 "9e8f400711cced192f7c236640c58d5e83ad7531aa581179ce667921aef5acc5"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "9c92efc76fefb1b8eb10d8a50b7a7bd8bee8fbda68e78fc50ed7dc769e937acb"

    url "https://ide.qoder.com.cn/qoder/release/#{version}/Qoder-CN-IDE-darwin-x64.dmg"
  end

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
