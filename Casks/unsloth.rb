cask "unsloth" do
  version "0.1.801-beta"
  sha256 "9d2156a6d80b540a501bba188318c8654ed1610fb49dd0a778931fa623dc961a"

  url "https://github.com/unslothai/unsloth/releases/download/v#{version}/Unsloth-Desktop-#{version.tr(".-", "_")}-MacOS.dmg"
  name "Unsloth Desktop"
  desc "本地运行与训练 LLM、扩散模型的桌面应用"
  homepage "https://unsloth.ai/"

  livecheck do
    url :url
    strategy :github_releases
    regex(/^v?(\d+(?:\.\d+)+-beta)$/i)
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Unsloth.app"

  zap trash: [
    "~/Library/Application Support/ai.unsloth.studio",
    "~/Library/Caches/ai.unsloth.studio",
    "~/Library/Preferences/ai.unsloth.studio.plist",
    "~/Library/Saved Application State/ai.unsloth.studio.savedState",
  ]
end
