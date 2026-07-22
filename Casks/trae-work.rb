cask "trae-work" do
  version "2.3.58364"

  on_arm do
    sha256 "709e48c1f485fa6ab0aefe07746a71d6331d58b799024cba279c1ae2ad69eea0"

    url "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/#{version}/darwin/TRAE_Work-darwin-arm64.dmg",
        verified: "lf-cdn.trae.ai/obj/trae-ai-us/"
  end
  on_intel do
    sha256 "a89787281fbd5aee87be2c09dd4bb8fea60b7a03efe0a5fbb3fd04d06b2058d9"

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
