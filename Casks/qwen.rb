cask "qwen" do
  version "1.0.2.6"

  on_arm do
    sha256 "dc55f90cb8ad04e0d1d6f2f1e58939512615ad143bb3402eeaed929dc6a4f0fd"

    url "https://download.qwen.ai/macos/arm64/Qwen-#{version}-release-mac-arm64.dmg"
  end
  on_intel do
    sha256 "91360d2c7381346a94db3f9d2dc34a26c640d0de4146be894e00f20df9b8893f"

    url "https://download.qwen.ai/macos/x64/Qwen-#{version}-release-mac-x64.dmg"
  end

  name "Qwen"
  desc "Alibaba 的 Qwen(通义千问)国际版桌面端,Qwen Studio 多模态 AI 助手"
  homepage "https://qwen.ai/"

  # livecheck: 试过的所有自动源都不可用 —— skip,需要手维护。
  #
  # 1. qwen.ai/download 是 SPA,dmg URL 是 React 后挂的,静态 HTML 里没有,
  #    :page_match / :github_releases / :json 都拿不到版本号。
  # 2. qwen.ai 没有 changelog / release-notes / updates 页(全 404)。
  # 3. chat.qwen.ai/api/version 返回的是 web 端版本号(0.4.4),不是 desktop,
  #    而且无视 platform/app/channel 等 query 参数。
  # 4. App 里 app-update.yml 指向 https://cdnwl.qwenlm.ai/qwenchat-backend/test/
  #    (electron-updater generic provider),但那里没有 latest-mac.yml,
  #    说明上游 dmg 是手工上传、没启用 auto-update。
  # 5. download.qwen.ai OSS bucket 目录列表被禁用,无法枚举 dmg。
  # 6. CDN 也没有 redirect 端点(macos/latest, macos/stable 等全 404),
  #    所以 :header_match 也无法从 Location header 抓版本号 —— brew livecheck
  #    默认策略和 block 形式都拿不到上游新版本号。
  #
  # 维护流程:每几个月到 https://qwen.ai/download 点 macOS(ARM/x64)按钮,
  # 从下载链接抓新版本号(同时下载 dmg 算 sha256),手动改 version + sha256。
  livecheck do
    skip "上游无 changelog 页、download 页是 SPA、CDN 无 redirect / latest 端点、bucket 列表禁用 —— 无法自动;手维护流程见上方注释"
  end

  # App 的 Info.plist LSMinimumSystemVersion = 11.0(Big Sur)。
  depends_on macos: :big_sur

  app "Qwen.app"

  zap trash: [
    "~/Library/Application Support/Qwen",
    "~/Library/Caches/Qwen",
    "~/Library/Logs/Qwen",
    "~/Library/Preferences/com.qwen.chat.plist",
  ]
end
