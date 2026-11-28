cask "cfpilot" do
  version "0.60.0-beta.3"
  sha256 "9cb4724cc369d4a90722b4b257badc09d4744e81296a0a77814c4ad5342cda7e"

  url "https://github.com/xmwengxing/CFPilot/releases/download/v#{version}/cfpilot-#{version}-macos-universal.dmg"
  name "CFPilot"
  desc "Cloudflare Workers 代理微内核与真连接优选面板,一键部署 VLESS/Trojan/XHTTP"
  homepage "https://github.com/xmwengxing/CFPilot"

  livecheck do
    url :url
    strategy :github_releases
    regex(/^v?(\d+(?:\.\d+)+(?:-beta(?:\.\d+)?)?)$/i)
  end

  depends_on macos: :monterey

  app "CFPilot.app"

  zap trash: [
    "~/.cfpilot",
    "~/Library/Caches/com.xmwengxing.cfpilot",
    "~/Library/Preferences/com.xmwengxing.cfpilot.plist",
    "~/Library/Saved Application State/com.xmwengxing.cfpilot.savedState",
    "~/Library/WebKit/com.xmwengxing.cfpilot",
  ]
end
