# jangrui/homebrew-tap

我的个人 [Homebrew](https://brew.sh) tap,收录一些**作者尚未做 brew 支持 / 作者的 tap 长期不更新**的 macOS 工具和 App。

## 用法

```bash
# 添加 tap
brew tap jangrui/homebrew-tap

# 安装 cask(新版 brew 不需要 --cask 参数,会自动识别)
brew install maccalendar
# 或者显式指定
brew install --cask maccalendar

# 安装 formula
brew install wps365-cli
brew install camofox-browser
# camofox-browser 装完即用:install 阶段编译 better-sqlite3 原生绑定并拉取
# Camoufox 浏览器二进制(~/Library/Caches/camoufox),post_install 会校验两者,
# 浏览器下载失败会直接报错(需能访问 github.com/daijro/camoufox/releases)
brew services start camofox-browser   # REST API 监听 http://localhost:9377

# 升级 / 卸载
brew upgrade <name>
brew uninstall <name>
```

## 收录

### Casks (GUI App)

| 名称 | 说明 | 上游 |
|---|---|---|
| [maccalendar](./Casks/maccalendar.rb) | 离线 macOS 菜单栏日历,支持中国农历/节假日/系统日程 | [bylinxx/MacCalendar](https://github.com/bylinxx/MacCalendar) |
| [minimax-code](./Casks/minimax-code.rb) | MiniMax Agent 桌面端,多 Agent 协作 + 工作区文件批量处理 + 浏览器自动化 | [agent.minimaxi.com](https://agent.minimaxi.com) |
| [qoder-cn](./Casks/qoder-cn.rb) | 阿里 Qoder CN IDE,为真实软件开发打造的智能体自主开发工作台 | [qoder.com.cn](https://qoder.com.cn/) |
| [qoderwork-cn](./Casks/qoderwork-cn.rb) | QoderWork CN,本地运行、自主规划、安全可控的 AI 工作搭子 | [qoder.com.cn](https://qoder.com.cn/) |
| [qoderwake-cn](./Casks/qoderwake-cn.rb) | QoderWake CN,全天在线的数字员工 | [qoder.com.cn](https://qoder.com.cn/) |
| [qwen](./Casks/qwen.rb) | Alibaba Qwen(通义千问)国际版桌面端,Qwen Studio 多模态 AI 助手 | [qwen.ai](https://qwen.ai) |
| [trae-work](./Casks/trae-work.rb) | byteDance TRAE Work 桌面端,AI agent 三模式(work/code/design),Web/Desktop/Mobile 跨端 | [trae.ai](https://www.trae.ai/) |
| [wps-note](./Casks/wps-note.rb) | WPS AI 笔记,录音转写 + AI 智能助理(WPS AI)+ 多端云同步 | [ainote.kdocs.cn](https://ainote.kdocs.cn/) |
| [zcode](./Casks/zcode.rb) | Z.ai 的 Agentic Development Environment,内置 GLM-5.2 coding agent | [zcode.z.ai](https://zcode.z.ai) |

> **为什么自建?** 原作者 `bylinxx/homebrew-tap` 的 cask 长期不更新:
> 1. macOS 版本限制用了新版 Homebrew 已废弃的字符串语法,每次操作弹 deprecation warning
> 2. cask 里的版本号(1.4.0)和 dmg 文件名(`MacCalendar_#{version}.dmg`)都已过时,作者最新 release 已改名 `MacCalendar.dmg` 并升到 1.6.11
>
> 本 tap 跟踪上游最新版本,并修正了语法。

### Formula (CLI 工具)

| 名称 | 说明 | 上游 |
|---|---|---|
| [wps365-cli](./Formula/wps365-cli.rb) | WPS 365 命令行客户端(Rust 预编译二进制) | [wps365-open/cli](https://github.com/wps365-open/cli) |
| [camofox-browser](./Formula/camofox-browser.rb) | 面向 AI agent 的反检测浏览器服务器,Camoufox 引擎 + REST API + CLI | [redf0x1/camofox-browser](https://github.com/redf0x1/camofox-browser) |
| [qoder-cli-cn](./Formula/qoder-cli-cn.rb) | Qoder CN CLI,终端原生的 AI 编程搭档(预编译二进制) | [qoder.com.cn](https://qoder.com.cn/) |

## 目录结构

```
homebrew-tap/
├── Casks/             # GUI App (brew install --cask xxx)
│   ├── maccalendar.rb
│   ├── minimax-code.rb
│   ├── qoder-cn.rb
│   ├── qoderwork-cn.rb
│   ├── qoderwake-cn.rb
│   ├── qwen.rb
│   ├── trae-work.rb
│   ├── wps-note.rb
│   └── zcode.rb
├── Formula/           # 命令行工具 (brew install xxx)
│   ├── wps365-cli.rb
│   ├── camofox-browser.rb
│   └── qoder-cli-cn.rb
└── .github/workflows/
    └── auto-bump.yml  # 每天自动 livecheck + bump + PR
```

## 更新上游版本

**日常基本不用手动维护。** `.github/workflows/auto-bump.yml` 每天(北京时间 04:00)自动跑一次:
对每个 cask / formula 跑 `brew livecheck` → 若有新版则 `brew bump-*-pr` 算出新 sha256 并自动开 PR → squash merge 到 `main`。手改配方前最好确认没人在同时跑 workflow。

只在配方需要新增 / 大改时手动操作。

### 新增配方

```bash
# 1. 创建文件
#    Casks/<name>.rb      — GUI App,安装到 /Applications
#    Formula/<name>.rb    — CLI 工具,链接到 brew --prefix/bin

# 2. 在文件里写 url + sha256(下面有公式)

# 3. 验证
brew style Casks/<name>.rb        # rubocop 风格检查
brew audit --new --cask <name>    # 或 --formula,跑 --new 时会做更严的检查
brew livecheck --cask <name>      # 或 --formula,确认能拿到 latest

# 4. 提交并推送,后续自动 bump workflow 会接管
```

### 算 sha256 的两种姿势

**A. 上游发 GitHub Release(以 maccalendar 为例):**

```bash
# 1. 查最新版本号和 dmg 下载地址
gh release view --repo bylinxx/MacCalendar

# 2. 算 sha256(把 URL 替换成上一步拿到的)
curl -sL "<dmg 下载 url>" | shasum -a 256

# 3. 改 Casks/maccalendar.rb 里的 version 和 sha256
```

**B. 上游只发 npm(以 camofox-browser 为例):**

```bash
# 1. 拿 tarball URL 和 sha
curl -s https://registry.npmjs.org/<pkg>/latest | python3 -c \
  "import sys,json; d=json.load(sys.stdin); print(d['version']); print(d['dist']['tarball']); print(d['dist']['shasum'])"

# 2. 验证 sha256(npm 的 shasum 是 sha1,brew 要 sha256,要重新算)
curl -sL "<tarball url>" | shasum -a 256

# 3. 改 Formula/<name>.rb 里的 url / sha256
```

### livecheck 策略

配方里的 `livecheck` 块决定 workflow 怎么查最新版,跟上游发布方式要匹配:

| 上游 | 策略 |
|---|---|
| GitHub Releases | `strategy :github_releases`(url 默认就是 `homepage` 的 GitHub 仓库) |
| GitHub Releases 但 tag 没 `v` 前缀 | `strategy :github_releases`,配合 URL 模板 |
| npm registry | `strategy :json` + `url "https://registry.npmjs.org/<pkg>/latest"`,block 里 `json["version"]` |
| CDN 无 API,版本号只在网页发布(如 zcode 历史做法) | `strategy :page_match` + 指向 changelog 页的 `url`,配合 `regex` 提取版本号。注意 changelog 常滞后于客户端推送 |
| electron-updater app 但 dmg 文件名含 build 号、无法从 version 推导(如 qwen) | `strategy :electron_builder` + `url` 指向 `latest-mac.yml`(feed URL 通常写死在 main process,不是 `app-update.yml`)— livecheck 可自动扫到新版本,但 bump 阶段 dmg url/sha256 仍需手维护 |
| 上游提供公开 GET manifest API 但形态不利于 livecheck(如 zcode 历史做法) | 自建代理 feed 转成标准 yaml 后 `:electron_builder` 指 raw GitHub。**注意**:如果上游有 stable/preview 频道,选择 preview (`channel=3`) 以提前跟进版本,等 stable 流追上后行为自然收敛 |
| 上游 update API 私有但支持 GET 查询(如 trae-work) | `strategy :json` + 逆向出的 GET 端点,block 里 dig 出版本字段(如 `json.dig("data","manifest","darwin","version")`)。客户端必填参数可从 App 包 `out/main.js` 里挖;自报版本参数(如 `appVersion`)填旧值,强制服务端始终返回最新 manifest。cask 的 `version` 用 byteDance 内部 build 号(而非公开 marketing version),这样 `#{version}` 模板能拼出真实 dmg CDN 路径 |
| CDN 无 API、无公开 feed、版本号只在文档站发布(如 zcode、minimax-code) | `strategy :page_match` + 指向 changelog 页的 `url`(Mintlify 站点可优先用 `/docs/changelog.md` markdown 镜像),配合 `regex` 提取 `vX.Y.Z` |
| 官网提供公开 JSON 版本历史 API(如 wps-note 的 ainote.kdocs.cn `/home/api/versions/history`) | `strategy :json` + 指向 `?client_type=mac_arm&page=1&page_size=1` 的 `url`,block 里 `json.dig("data", "list")&.first&.dig("version")`。下载地址和版本号同 API 返回,`on_arm`/`on_intel` 各自包不同后缀(arm64 / x64) |
| 上游提供 channels/manifest.json 发布清单(如 qoderwake-cn、qoder-cli-cn) | `strategy :json` + 指向 manifest 的 `url`,block 里 `json["latest"]`。manifest 里每个平台的 url/sha256 都有,bump 时直接取用(已抽验与实测下载一致) |
| changelog 页混排多条产品线、版本号互相穿插(如 qoder-cn 的更新日志同时列 IDE 1.x 和 JetBrains 插件 3.x) | `strategy :page_match` + `\A` 锚定 + 懒惰匹配只取页面第一个版本号(IDE 排最前):`regex(/\A.*?v?(\d+(?:\.\d+)+)\s*\(\d{4}-\d{2}-\d{2}\)/im)`。**坑**:livecheck 对多个匹配取最大值,不锚定会拿到 JetBrains 的 3.x |
| 上游只提供 `releases/latest` 固定链接、版本化路径 403(如 qoderwork-cn) | 无法 livecheck:`version :latest` + `sha256 :no_check` + `livecheck { skip }`,URL 永远指向最新,bump workflow 状态为 `skipped` 属正常 |
| 其它 | 见 [Homebrew livecheck 文档](https://docs.brew.sh/Brew-Livecheck) |
