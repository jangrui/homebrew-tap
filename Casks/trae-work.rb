cask "trae-work" do
  version "2.3.76923"

  on_arm do
    sha256 "c1e78a1e2d5505d1adbed2278d583ea607730d768f131a4732fab6c5b1f7df94"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TraeWork-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "c42f1ed9ae0147da78cdeb41dc243bda9708fcd3eac8e4a6ff11cc0638be6bc9"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TraeWork-darwin-x64.dmg"
  end

  name "TRAE Work"
  desc "ByteDance AI agent 桌面端(work/code/design 三模式,Web/Desktop/Mobile 跨端)"
  homepage "https://www.trae.ai/"

  livecheck do
    url "https://icube-normal.traeapi.us/icube/api/v1/native/version/trae/latest"
    strategy :json do |json|
      json.dig("data", "solo", "darwin", "download", 0, "apple")[%r{/stable/(\d+(?:\.\d+)+)/}, 1]
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
