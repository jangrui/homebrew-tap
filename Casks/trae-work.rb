cask "trae-work" do
  # byteDance 内部版本模型:
  #   - "marketing version"(如 0.1.31)是 product.json appVersion,但 dmg CDN 路径不用这个,
  #     且 byteDance 公开 changelog 滞后于真实发布(changelog 最新只到 0.1.23,实际已 0.1.31+)。
  #   - "build 号"(如 2.3.56914)是 dmg CDN 路径 .../releases/stable/<build>/... 的真实段,
  #     也是本仓库 feeds/trae-work/latest-mac.yml 的 version 字段,跟 dmg 1:1 对应。
  # 用 build 号做 cask version 是为了让 url 模板 #{version} 能拼出真实 dmg 路径,
  # 同时 feed yaml version 跟 cask version 对齐,apply_electron_builder_bump 才能自动 bump。
  version "2.3.56914"

  on_arm do
    sha256 "62ae4bbb86ccd2f23c0dd950e42122ba94fb9464468cdc5544663908acbae97f"

    url "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/#{version}/darwin/TRAE_Work-darwin-arm64.dmg",
        verified: "lf-static.traecdn.us/obj/trae-ai-tx/"
  end
  on_intel do
    sha256 "9111c1e13056b7b86c8b7e0fd7e95de7370c58eb139f3f2af61bdfde0aefff17"

    url "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/#{version}/darwin/TRAE_Work-darwin-x64.dmg",
        verified: "lf-static.traecdn.us/obj/trae-ai-tx/"
  end

  name "TRAE Work"
  desc "ByteDance AI agent 桌面端(work/code/design 三模式,Web/Desktop/Mobile 跨端)"
  homepage "https://www.trae.ai/"

  # byteDance 没暴露任何公开的 electron-builder feed(Resources/app-update.yml 是
  # `provider: custom, url: ''` 空占位符,update 走自家 POST /icube/api/v1/package/check_update
  # 响应里给 feedURL + version)。我们仓库里 .github/workflows/feed-trae-work.yml 每天
  # 喂 feeds/trae-work/latest-mac.yml,这里直接消费这个自建 feed。auto-bump.yml 的
  # apply_electron_builder_bump 会从 yaml 的 files[] 拿真实 dmg 路径(含 byteDance
  # 内部 build 号)覆盖 url + sha256,完全自动维护,无需人手。
  livecheck do
    url "https://raw.githubusercontent.com/jangrui/homebrew-tap/main/feeds/trae-work/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on macos: :monterey

  app "TRAE SOLO.app"

  zap trash: [
    "~/Library/Application Support/.trae",
    "~/Library/Application Support/TRAE SOLO",
    "~/Library/Caches/com.trae.solo.app",
    "~/Library/Preferences/com.trae.solo.app.plist",
  ]
end
