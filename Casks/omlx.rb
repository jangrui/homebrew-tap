cask "omlx" do
  version "0.8.2"

  on_sequoia :or_older do
    sha256 "f081fee936f4c706459db8f69d79c9bf25df099b6a0e71ffec7c65ca23d2b1fd"

    url "https://github.com/jundot/omlx/releases/download/v#{version}/oMLX-#{version}-macos15-sequoia.dmg"
  end
  on_tahoe :or_newer do
    sha256 "6316ad32cde3248bcf23abece8b9222847f7ae8e594cea1b378a34049252df78"

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
