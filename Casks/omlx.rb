cask "omlx" do
  version "0.7.3"

  on_sequoia :or_older do
    sha256 "cd5e3b454798a002f32ef2f3bf06ae033ea2f4e5b02aa039a2c68445498605f1"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos15-sequoia.dmg"
  end
  on_tahoe :or_newer do
    sha256 "2acfde41aeac0b022dbca803ca109437f3ccaf0c33f3415881526b985bee86f2"

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
