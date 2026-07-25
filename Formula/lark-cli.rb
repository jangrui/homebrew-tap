class LarkCli < Formula
  desc "飞书/Lark 官方命令行工具"
  homepage "https://github.com/larksuite/cli"
  version "1.0.77"

  url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-arm64.tar.gz"
  sha256 "d82c4a864ebd1e2a2d95941aee39c34d7b91077c472d3fb5984b76826ef9f693"

  on_intel do
    url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-amd64.tar.gz"
    sha256 "1236b3a301f543e6d7d434059515951d0acfa65376a309ee31c533c238f023d1"
  end

  def install
    bin.install "lark-cli"
  end

  livecheck do
    url "https://github.com/larksuite/cli/releases/latest"
    strategy :github_latest
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lark-cli --version")
  end
end
