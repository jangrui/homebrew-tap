cask "omlx" do
  version "0.6.3"

  on_sequoia :or_older do
    sha256 "d56c37e55b17f478f532567016d3b2b325423234727d3036a65b491dd4030a2c"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos15-sequoia.dmg"
  end
  on_tahoe :or_newer do
    sha256 "5bde65e35c0cc3e7b0365c0e078f98d7571cb71c6a6bead591329a2cf8287537"

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
