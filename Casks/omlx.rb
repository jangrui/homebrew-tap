cask "omlx" do
  version "0.7.2"

  on_sequoia :or_older do
    sha256 "86e50d13ecbdf8531a5e39684619b0b0a609ec06e1c1fab866daa74e0e47b32e"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos15-sequoia.dmg"
  end
  on_tahoe :or_newer do
    sha256 "0ceddaf7a8901d440bc88acb3e033b294ad4d1b45b57d02fb73833c839d270b9"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos26-27.dmg"
  end

  name "oMLX"
  desc "LLM inference server with continuous batching and SSD caching for Apple Silicon"
  homepage "https://omlx.ai/"

  livecheck do
    url "https://github.com/jundot/omlx/releases"
    regex(/\Av?(\d+(?:\.\d+)+)\Z/)
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "oMLX.app"

  zap trash: [
    "~/.omlx",
    "~/Library/Application Support/oMLX",
    "~/Library/Caches/app.omlx",
    "~/Library/HTTPStorages/app.omlx",
    "~/Library/Preferences/app.omlx.plist",
    "~/Library/Saved Application State/app.omlx.savedState",
  ]
end
