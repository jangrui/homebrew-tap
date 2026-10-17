cask "trae-work" do
  arch arm: "arm64", intel: "x64"

  version "2.3.91090"
  sha256 arm:   "31d0b55fa25d21d39712a807a76a3b59ec442f44ac406f6069730f51ac4c3b3c",
         intel: "ffa396718f0d38e04ce0f0109b49c00e042bf807373c86bfbdf7cabd69c552d8"

  url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TraeWork-darwin-#{arch}.dmg"
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
