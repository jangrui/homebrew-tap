cask "unsloth" do
  version "0.1.921-beta"
  sha256 "a3cd892aa2561d1c14c7b75d87721702521b365997dc8fba1bd551f70f3527a1"

  url "https://github.com/unslothai/unsloth/releases/download/v#{version}/Unsloth-Desktop-MacOS.dmg"
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
