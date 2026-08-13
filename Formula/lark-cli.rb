class LarkCli < Formula
  desc "飞书/Lark 官方命令行工具"
  homepage "https://github.com/larksuite/cli"
  version "1.0.87"

  livecheck do
    url "https://github.com/larksuite/cli/releases/latest"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-arm64.tar.gz"
      sha256 "b4cf7b1b7ff9c3d8c9ac3dd577fd178f3c8a84ec82184a82de809335840d5b20"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-darwin-amd64.tar.gz"
      sha256 "40f005dc39e955ad3fa51a05b1a91619f0ccec1e781038fa247058e4c85b02a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-arm64.tar.gz"
      sha256 "fade9a22d363172a9c18a8287c99c80d6d106a2900f3fce4015e4e156c5fc776"
    end
    on_intel do
      url "https://github.com/larksuite/cli/releases/download/v#{version}/lark-cli-#{version}-linux-amd64.tar.gz"
      sha256 "6027b1ddc12440400581bbdf9554850d8e119c7dd400439b1220e7a87b9673c5"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lark-cli --version")
  end
end
