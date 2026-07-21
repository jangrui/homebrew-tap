cask "qwen" do
  version "1.0.5"

  on_arm do
    sha256 "20e51560de08f626419711c9ac6cd81184f5e0fb98980b978310fdd81742a7cc"

    url "https://download.qwen.ai/macos/arm64/Qwen-1.0.5.164.dmg"
  end
  on_intel do
    sha256 "ae99d3aab8c6e9769e5d2b72e42b3e9a44e20208df650b580eab7f1896f748f4"

    url "https://download.qwen.ai/macos/x64/Qwen-1.0.5.163.dmg"
  end

  name "Qwen"
  desc "Alibaba 的 Qwen(通义千问)国际版桌面端,Qwen Studio 多模态 AI 助手"
  homepage "https://qwen.ai/"

  livecheck do
    url "https://download.qwen.ai/macos/arm64/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on macos: :big_sur

  app "Qwen.app"

  zap trash: [
    "~/Library/Application Support/Qwen",
    "~/Library/Caches/Qwen",
    "~/Library/Logs/Qwen",
    "~/Library/Preferences/com.qwen.chat.plist",
  ]
end
