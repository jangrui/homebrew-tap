# jangrui/homebrew-tap

我的个人 [Homebrew](https://brew.sh) tap,收录一些**作者尚未做 brew 支持 / 作者的 tap 长期不更新**的 macOS 工具和 App。

## 用法

```bash
# 添加 tap
brew tap jangrui/homebrew-tap

# 安装 cask (新版 brew 可省略 --cask)
brew install --cask maccalendar

# 安装 formula
brew install wps365-cli
brew install camofox-browser
brew services start camofox-browser   # REST API: http://localhost:9377

# 升级 / 重装 / 卸载
brew upgrade <name>
brew reinstall <name>
brew uninstall <name>
```

## 收录

### Casks (GUI App)

| 名称 | 说明 | 上游 |
|---|---|---|
| [easycliproxyapi](./Casks/easycliproxyapi.rb) | EasyCLIProxyAPI 桌面端,CLIProxyAPI 的 GUI + 主流 AI Agent(Claude/Codex 等)自动配置工具 | [router-for-me/EasyCLIProxyAPI](https://github.com/router-for-me/EasyCLIProxyAPI) |
| [maccalendar](./Casks/maccalendar.rb) | 离线 macOS 菜单栏日历,支持中国农历/节假日/系统日程 | [bylinxx/MacCalendar](https://github.com/bylinxx/MacCalendar) |
| [marvis](./Casks/marvis.rb) | 腾讯 Marvis 马维斯,操作系统层级 AI 助手(本地知识库 + 跨端操控),仅 arm64 | [marvis.qq.com](https://marvis.qq.com/) |
| [minimax-code](./Casks/minimax-code.rb) | MiniMax Agent 桌面端,多 Agent 协作 + 工作区文件批量处理 + 浏览器自动化 | [agent.minimaxi.com](https://agent.minimaxi.com) |
| [mouser](./Casks/mouser.rb) | Logitech Options+ 开源替代品,HID++ 鼠标按键重映射 + 按应用配置 | [TomBadash/Mouser](https://github.com/TomBadash/Mouser) |
| [omniroute-app](./Casks/omniroute-app.rb) | OmniRoute 桌面端(Electron),统一 AI 网关,聚合 160+ 提供商的浏览器仪表盘 | [diegosouzapw/OmniRoute](https://github.com/diegosouzapw/OmniRoute) |
| [openchatcut](./Casks/openchatcut.rb) | 本地优先的对话式 AI 视频编辑器,多轨时间线 + 自然语言剪辑 | [0xsline/OpenChatCut](https://github.com/0xsline/OpenChatCut) |
| [codexsplit](./Casks/codexsplit.rb) | CodexSplit(Codex Desktop)本地 AI 工作台,网关、语音、会话管理、第三方模型与 Agent 工具,仅 arm64 | [AITabby/opencodex](https://github.com/AITabby/opencodex) |
| [opensquilla](./Casks/opensquilla.rb) | OpenSquilla 桌面端,Token 高效的本地 AI Agent(SquillaRouter 模型路由 + 多工具 + 本地记忆),仅 arm64 | [opensquilla/opensquilla](https://github.com/opensquilla/opensquilla) |
| [qoder-cn](./Casks/qoder-cn.rb) | 阿里 Qoder CN IDE,为真实软件开发打造的智能体自主开发工作台 | [qoder.com.cn](https://qoder.com.cn/) |
| [qoderwork-cn](./Casks/qoderwork-cn.rb) | QoderWork CN,本地运行、自主规划、安全可控的 AI 工作搭子 | [qoder.com.cn](https://qoder.com.cn/) |
| [qoderwake-cn](./Casks/qoderwake-cn.rb) | QoderWake CN,全天在线的数字员工 | [qoder.com.cn](https://qoder.com.cn/) |
| [qwen](./Casks/qwen.rb) | Alibaba Qwen(通义千问)国际版桌面端,Qwen Studio 多模态 AI 助手 | [qwen.ai](https://qwen.ai) |
| [reasonix-app](./Casks/reasonix-app.rb) | Reasonix Desktop,DeepSeek 原生 AI coding agent 桌面端(prefix-cache 稳定性设计) | [esengine/DeepSeek-Reasonix](https://github.com/esengine/DeepSeek-Reasonix) |
| [trae-work](./Casks/trae-work.rb) | byteDance TRAE Work 桌面端,AI agent 三模式(work/code/design),Web/Desktop/Mobile 跨端 | [trae.ai](https://www.trae.ai/) |
| [unsloth](./Casks/unsloth.rb) | Unsloth Desktop,本地运行与训练 LLM/扩散模型,仅 Apple Silicon | [unslothai/unsloth](https://github.com/unslothai/unsloth) |
| [wps-note](./Casks/wps-note.rb) | WPS AI 笔记,录音转写 + AI 智能助理(WPS AI)+ 多端云同步 | [ainote.kdocs.cn](https://ainote.kdocs.cn/) |
| [workbuddy](./Casks/workbuddy.rb) | 腾讯 WorkBuddy AI 办公工作台(自然语言下任务、多 Agent 执行、交付文档/PPT,打通腾讯文档/会议/邮箱生态) | [www.workbuddy.cn](https://www.workbuddy.cn/) |
| [zcode](./Casks/zcode.rb) | Z.ai 的 Agentic Development Environment,内置 GLM-5.2 coding agent | [zcode.z.ai](https://zcode.z.ai) |

> **为什么自建?** 原作者 `bylinxx/homebrew-tap` 的 cask 长期不更新:
> 1. macOS 版本限制用了新版 Homebrew 已废弃的字符串语法,每次操作弹 deprecation warning
> 2. cask 里的版本号(1.4.0)和 dmg 文件名(`MacCalendar_#{version}.dmg`)都已过时,作者最新 release 已改名 `MacCalendar.dmg` 并升到 1.6.11
>
> 本 tap 跟踪上游最新版本,并修正了语法。

### Formula (CLI 工具)

| 名称 | 说明 | 上游 |
|---|---|---|
| [dbx-mcp](./Formula/dbx-mcp.rb) | DBX 数据库 MCP server,AI agent 直查 MySQL/PostgreSQL 等(npm 包装 + Rust 预编译平台二进制) | [t8y2/dbx](https://github.com/t8y2/dbx) |
| [wps365-cli](./Formula/wps365-cli.rb) | WPS 365 命令行客户端(Rust 预编译二进制) | [wps365-open/cli](https://github.com/wps365-open/cli) |
| [camofox-browser](./Formula/camofox-browser.rb) | 面向 AI agent 的反检测浏览器服务器,Camoufox 引擎 + REST API + CLI | [redf0x1/camofox-browser](https://github.com/redf0x1/camofox-browser) |
| [qoder-cli-cn](./Formula/qoder-cli-cn.rb) | Qoder CN CLI,终端原生的 AI 编程搭档(预编译二进制) | [qoder.com.cn](https://qoder.com.cn/) |
| [lark-cli](./Formula/lark-cli.rb) | 飞书/Lark 官方命令行工具(预编译二进制) | [larksuite/cli](https://github.com/larksuite/cli) |
| [omniroute](./Formula/omniroute.rb) | OmniRoute CLI,统一 AI 网关,聚合 160+ 提供商到单一 OpenAI 兼容端点(Next.js standalone + 原生模块) | [diegosouzapw/OmniRoute](https://github.com/diegosouzapw/OmniRoute) |
| [opencodex](./Formula/opencodex.rb) | OpenAI Codex 与 Claude Code 的通用 provider 代理,接入任意 LLM | [lidge-jun/opencodex](https://github.com/lidge-jun/opencodex) |
