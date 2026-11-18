cask "minimax-design" do
  arch arm: "arm64", intel: "x64"

  version "4.0.15"
  sha256 arm:   "44b260b4bd0871c2b598ec0973e59af6be1b5a156c5a5898695be65dc098bac5",
         intel: "90b70b4d839975b726f73399f5d7b8ba34ced60d0c91c98be8d17eb3f9f37c05"

  url "https://filecdn.minimax.chat/public/minimax-hub/release/domestic/MiniMax%20Design-#{version}-#{arch}.dmg"
  name "MiniMax Design"
  desc "MiniMax AI Agent 创作平台,覆盖调研、脚本、图像、视频、配音的完整内容生产链路"
  homepage "https://design.minimaxi.com/"

  livecheck do
    url "https://filecdn.minimax.chat/public/minimax-hub/release/domestic/releases.osx-arm64.json"
    strategy :json do |json|
      json["Assets"]&.filter_map { |asset| asset["Version"] if asset["Type"] == "Full" }
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "MiniMax Design.app"

  uninstall quit: "com.minimax.hub"

  zap trash: [
    "~/Library/Application Support/@hilo",
    "~/Library/Application Support/MiniMax Hub",
    "~/Library/Caches/@hilo",
    "~/Library/Caches/com.minimax.hub",
    "~/Library/Caches/MiniMax Hub",
    "~/Library/HTTPStorages/com.minimax.hub",
    "~/Library/Preferences/com.minimax.hub.plist",
  ]
end
