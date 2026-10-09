cask "trae-work" do
  version "2.3.90450"

  on_arm do
    sha256 "8d0e3ca092e0085f4e2efe07f7de7d2bc1628c2a3f78918deff89c6eae1962e1"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TraeWork-darwin-arm64.dmg"
  end
  on_intel do
    sha256 "7e06fa4becf9283178b5d839f8f5e6dbfd7430aa9beebb668129e5f68baea1f5"

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
