cask "omlx" do
  version "0.7.1"

  on_sequoia :or_older do
    sha256 "7ecc0fd8ca6e026a7e117bb7b0ba5aeac4fe56945997fc2ba14b4801c7efc30b"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos15-sequoia.dmg"
  end
  on_tahoe :or_newer do
    sha256 "28b1f1a7b9e22451ea165710c972fa55b60c3581f3d5505750139346c23bd2fc"

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
