class LarkCli < Formula
  desc "飞书/Lark 官方命令行工具"
  homepage "https://github.com/larksuite/cli"
  version "1.0.96"

  livecheck do
    url "https://github.com/larksuite/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "124acdf380f72fa4b1b1e8307a0b00ee93217cf9558baca5bc40091304f2adcd"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-amd64.tar.gz"
      sha256 "f6bd28263dfc4a4d6c2581657efa6af8e8f92eba22394c9c4d840d4ad1fae65e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-arm64.tar.gz"
      sha256 "a83124bad70ddb5a42c8d10a80e8d52f49913b1cb397c7a0a835bd0ddb65f3e2"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-amd64.tar.gz"
      sha256 "5d1fa96832307b13298fdb11c477ab3f31c3e98026fec585b4b2eb7f63960c36"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lark-cli --version")
  end
end
