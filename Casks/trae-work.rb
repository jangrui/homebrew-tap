cask "trae-work" do
  version "2.3.61403"

  on_arm do
    sha256 "ae04de67f260cbfd05f827caa1ee59622ecd5910c0d9f88db81b88cbe2a4e3f2"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TRAE_Work-darwin-arm64.dmg",
        verified: "lf-cdn.trae.ai/obj/trae-ai-us/"
  end
  on_intel do
    sha256 "606e8bd284675e99db0f542e8531f3a55461e8fb6be03d92b872f01549d3d5db"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TRAE_Work-darwin-x64.dmg",
        verified: "lf-cdn.trae.ai/obj/trae-ai-us/"
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
