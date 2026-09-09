cask "trae-work" do
  version "2.3.82598"

  on_arm do
    sha256 "8fd25295b79a25f779504f49bdd1533a5549d3c5b43e6d71c934eb32f5426cd4"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TraeWork-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "7ace5f701433781df7db442b0e6c427c471a0dbdf21e037c1b2343b005dd439b"

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
