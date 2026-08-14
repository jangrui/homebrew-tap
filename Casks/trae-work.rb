cask "trae-work" do
  version "2.3.70845"

  on_arm do
    sha256 "fea1d36fc8bb02e9d4eae449a18fa1ce2b62c7c0ba0848142b941e0b1dc05aaf"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TraeWork-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "006de5a670d0dbba2f36c93442c16eaa83341bf8c2c6d83f109345ca601b064d"

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
