cask "quiet-md" do
  version "0.2.0"
  sha256 "b4212344d2664cc2cee925728c26209e49ebbe86ab7d793ab04d434897972aaa"

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
