# jangrui/homebrew-tap

我的个人 [Homebrew](https://brew.sh) tap,收录一些**作者尚未做 brew 支持 / 作者的 tap 长期不更新**的 macOS 工具和 App。

## 用法

```bash
# 添加 tap
brew tap jangrui/homebrew-tap

# 安装(新版 brew 不需要 --cask 参数,会自动识别)
brew install maccalendar
# 或者显式指定
brew install --cask maccalendar

# 升级
brew upgrade maccalendar

# 卸载
brew uninstall maccalendar
```

## 收录

### Casks (GUI App)

| 名称 | 说明 | 上游 |
|---|---|---|
| [maccalendar](./Casks/maccalendar.rb) | 离线 macOS 菜单栏日历,支持中国农历/节假日/系统日程 | [bylinxx/MacCalendar](https://github.com/bylinxx/MacCalendar) |

> **为什么自建?** 原作者 `bylinxx/homebrew-tap` 的 cask 长期不更新:
> 1. macOS 版本限制用了新版 Homebrew 已废弃的字符串语法,每次操作弹 deprecation warning
> 2. cask 里的版本号(1.4.0)和 dmg 文件名(`MacCalendar_#{version}.dmg`)都已过时,作者最新 release 已改名 `MacCalendar.dmg` 并升到 1.6.11
>
> 本 tap 跟踪上游最新版本,并修正了语法。

## 目录结构

```
homebrew-tap/
├── Casks/             # GUI App (brew install --cask xxx)
│   └── maccalendar.rb
└── Formula/           # 命令行工具 (brew install xxx) — 暂无,以后扩展
```

## 更新上游版本

以 maccalendar 为例:

```bash
# 1. 查最新版本号和 dmg 下载地址
gh release view --repo bylinxx/MacCalendar

# 2. 算 sha256(把 URL 替换成上一步拿到的)
curl -sL "<dmg 下载 url>" | shasum -a 256

# 3. 改 Casks/maccalendar.rb 里的 version 和 sha256,提交即可
```
