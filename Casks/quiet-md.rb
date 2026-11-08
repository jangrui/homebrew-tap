cask "quiet-md" do
  version "0.1.8"
  sha256 "5ba5da757a16eaef8a68955829afa84fb7ac7b6e28dc5636b0e10f79f5cd72bd"

  url "https://github.com/s1dashu/quiet-md/releases/download/v#{version}/quiet-md-#{version}-macos-arm64.zip"
  name "Quiet.md"
  desc "原生极速笔记应用(Rust + GPUI),本地优先,兼容飞书 DocxXML"
  homepage "https://quiet.md/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "quiet.md.app"

  zap trash: [
    "~/Library/Application Support/com.s1dashu.quietmd",
    "~/Library/Caches/com.s1dashu.quietmd",
    "~/Library/Preferences/com.s1dashu.quietmd.plist",
    "~/Library/Saved Application State/com.s1dashu.quietmd.savedState",
  ]
end
