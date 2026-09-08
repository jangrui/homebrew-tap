cask "unsloth" do
  version "0.1.807-beta"
  sha256 "e964a82e3cfb5d5df68130fa8544c1804be5401a109de6f45f08bc53f3b08f3c"

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
