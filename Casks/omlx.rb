cask "omlx" do
  version "0.8.4"

  on_sequoia :or_older do
    sha256 "4b83f19173fe5ed25d8adf358e9a6a4d4eefb83c14b90bd2ecd29bd1ec139d00"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos15-sequoia.dmg"
  end
  on_tahoe :or_newer do
    sha256 "445c3d42b1ac5dbdd1d8f1eadca0ad4e35dded846026b3ca3d8537dd7ce08a0b"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos26-27.dmg"
  end

  name "oMLX"
  desc "Apple Silicon 本地 LLM 推理服务器,连续批处理 + SSD 分层 KV 缓存"
  homepage "https://omlx.ai/"

  livecheck do
    url "https://github.com/jundot/omlx/releases"
    strategy :github_releases
    regex(/\Av?(\d+(?:\.\d+)+)\Z/)
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
