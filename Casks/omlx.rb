cask "omlx" do
  version "0.6.2"

  on_sequoia :or_older do
    sha256 "0728fa3f1004f4165e67f32995e98a69f47b53c649f7e2f3cc94fb629d819097"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos15-sequoia.dmg"
  end
  on_tahoe :or_newer do
    sha256 "199e9f3d3445e5b686c21b83a6ebb76e8a80c98ea5be06d76a7a8818190425e0"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos26-27.dmg"
  end

  name "oMLX"
  desc "LLM inference server with continuous batching and SSD caching for Apple Silicon"
  homepage "https://omlx.ai/"

  livecheck do
    url "https://github.com/jundot/omlx/releases"
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
