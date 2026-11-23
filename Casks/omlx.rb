cask "omlx" do
  version "0.8.3"

  on_sequoia :or_older do
    sha256 "f2122da492650d33ea89ad558e0572846738557b02e0e1fd7778520880069c0b"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos15-sequoia.dmg"
  end
  on_tahoe :or_newer do
    sha256 "a3985ac20f53a5a9a1656ec19353e00ff0a628aae1285bfa5164fd600217af07"

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
