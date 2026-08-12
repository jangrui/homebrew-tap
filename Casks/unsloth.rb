cask "unsloth" do
  version "0.1.701-beta"
  sha256 "24f8d78ae8533eb4134153f928863f290bc557e973081f7754b3451dd611e641"

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
