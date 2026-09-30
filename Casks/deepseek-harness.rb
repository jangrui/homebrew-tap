cask "deepseek-harness" do
  version "0.2.0-rc.2"

  on_arm do
    sha256 "7c32c459c403d8a035ac60600f240ed2025312f0a7afde283f454f30ec4ed96e"

    url "https://download.deepseek.com/dsh-desk/bin/mac-arm64/deepseek-harness-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "144fe463d56a2e62025c28d2f1d31dea2a838c5f35013c1f1ad1c1d42428335a"

    url "https://download.deepseek.com/dsh-desk/bin/mac-x64/deepseek-harness-#{version}-mac-x64.dmg"
  end

  name "DeepSeek Harness"
  desc "DeepSeek 官方 AI Agent 桌面工作台(Harness)"
  homepage "https://github.com/deepseek-ai/deepseek-harness"

  livecheck do
    url "https://github.com/deepseek-ai/deepseek-harness"
    strategy :github_releases do |json, regex|
      json = [json] unless json.is_a?(Array)
      json.filter_map { |release| release["tag_name"][regex, 1] if release["tag_name"] }
    end
    regex(/^\Adsh-v?(\d+(?:\.\d+)+(?:-rc\.\d+)?)\z/i)
  end

  depends_on macos: :ventura

  app "DeepSeek Harness.app"

  uninstall quit: "com.deepseek.dsh"

  zap trash: [
    "~/Library/Application Support/@deepseek-ai/dsh-desktop",
    "~/Library/Caches/com.deepseek.dsh",
    "~/Library/Caches/com.deepseek.dsh.ShipIt",
    "~/Library/HTTPStorages/com.deepseek.dsh",
    "~/Library/Logs/com.deepseek.dsh",
    "~/Library/Preferences/com.deepseek.dsh.plist",
    "~/Library/Saved Application State/com.deepseek.dsh.savedState",
    "~/Library/WebKit/com.deepseek.dsh",
  ]
end
