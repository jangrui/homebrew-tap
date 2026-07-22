cask "trae-work" do
  version "2.3.56914"

  on_arm do
    sha256 "62ae4bbb86ccd2f23c0dd950e42122ba94fb9464468cdc5544663908acbae97f"

    url "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/#{version}/darwin/TRAE_Work-darwin-arm64.dmg",
        verified: "lf-static.traecdn.us/obj/trae-ai-tx/"
  end
  on_intel do
    sha256 "9111c1e13056b7b86c8b7e0fd7e95de7370c58eb139f3f2af61bdfde0aefff17"

    url "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/#{version}/darwin/TRAE_Work-darwin-x64.dmg",
        verified: "lf-static.traecdn.us/obj/trae-ai-tx/"
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
