cask "trae-work" do
  version "2.3.68990"

  on_arm do
    sha256 "3b62d81b2d1883cdc1b5f878f9fb6d0d75f97256128abd1448ae0c7813ad8095"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TraeWork-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "54f192daa10c346404a862d1cde5460b6e907fcd7be54ae772689cd0a5f6f68e"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TraeWork-darwin-x64.dmg"
  end

  name "TRAE Work"
  desc "ByteDance AI agent 桌面端(work/code/design 三模式,Web/Desktop/Mobile 跨端)"
  homepage "https://www.trae.ai/"

  livecheck do
    url "https://icube-normal.traeapi.us/icube/api/v1/native/version/trae/latest"
    strategy :json do |json|
      json.dig("data", "solo", "darwin", "version")
    end
  end

  depends_on macos: :monterey

  app "TRAE SOLO.app"

  zap trash: [
    "~/Library/Application Support/.trae",
    "~/Library/Application Support/TRAE SOLO",
    "~/Library/Caches/com.trae.solo.app",
    "~/Library/Preferences/com.trae.solo.app.plist",
  ]
end
