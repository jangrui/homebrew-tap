class QoderCliCn < Formula
  desc "终端原生的 AI 编程搭档,也是可被集成的智能体引擎"
  homepage "https://qoder.com.cn/"
  version "1.1.99"

  livecheck do
    url "https://static.qoder.com.cn/qoder-cli-cn/channels/manifest.json"
    strategy :json do |json|
      json["latest"]
    end
  end

  on_macos do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-arm64.tar.gz"
      sha256 "1b57a0ed19327ef848716a4da17b17bb36aab4e8d45d5dca678b32f909f71991"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-x64.tar.gz"
      sha256 "66682ca0ecff922a7a95be2450f155b0674ac0293750c627bcd9f3a7717135a9"
    end
  end

  on_linux do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-arm64.tar.gz"
      sha256 "c04b0767e79233889127897c249f8b0d904b50b884a27beab1cbb945a775ed66"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-x64.tar.gz"
      sha256 "d5c4feb40be6b50ddf213f3d8430d452367d6377b766c76a391320eea697bd1a"
    end
  end

  def install
    bin.install "qoderclicn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qoderclicn --version")
  end
end
