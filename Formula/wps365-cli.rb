# wps365-cli:WPS 365 命令行工具(预编译二进制版)
#
# 上游 https://github.com/wps365-open/cli 按 Rust target 分发 tar.gz,
# 里面是单个预编译的 wps365-cli 二进制,无需编译。
class Wps365Cli < Formula
  desc "WPS 365 命令行工具"
  homepage "https://github.com/wps365-open/cli"
  # 注意:URL 用了 v#{version} 插值,brew audit 会报 "version redundant with URL"
  # 但删掉 version 行会导致 version=nil(URL 模板无法反扫),所以必须保留。
  version "0.2.0"

  # macOS Apple Silicon(默认)
  url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-aarch64-apple-darwin.tar.gz",
      verified: "github.com/wps365-open/cli/"
  sha256 "773e67b45cec403ffd595aef4513bfaeac968d2b6f6638c0b3e33afb17b687ef"

  # macOS Intel 覆盖
  on_intel do
    url "https://github.com/wps365-open/cli/releases/download/v#{version}/wps365-cli-x86_64-apple-darwin.tar.gz",
        verified: "github.com/wps365-open/cli/"
    sha256 "60467bd503ccbc82809769e42f8daee33a62310576ec5de71d64c7430bc108da"
  end

  def install
    bin.install "wps365-cli"
  end

  # livecheck:显式指定上游仓库 URL(不用 url :url),
  # 因为 formula 用了 on_intel 在 Linux Actions runner 上无有效 url,会导致 livecheck 失败。
  livecheck do
    url "https://github.com/wps365-open/cli/releases/latest"
    strategy :github_latest
  end
end
