class QoderCliCn < Formula
  desc "终端原生的 AI 编程搭档,也是可被集成的智能体引擎"
  homepage "https://qoder.com.cn/"
  version "1.1.65"

  livecheck do
    url "https://static.qoder.com.cn/qoder-cli-cn/channels/manifest.json"
    strategy :json do |json|
      json["latest"]
    end
  end

  on_macos do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-arm64.tar.gz"
      sha256 "04fcedb15acbd59577f595377ab38176c6c42e34f4f9e6a0dd9dcdea588a26f8"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-x64.tar.gz"
      sha256 "5327efcdd82e637387bcdbd237b9a9c5cc24c7976b5d5eedde8cfa85400fc9ec"
    end
  end

  on_linux do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-arm64.tar.gz"
      sha256 "c08c9b9763984cdfae5ac0e08f833a8f2856eaaebcbd02def21d36ca048610a5"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-x64.tar.gz"
      sha256 "a316b656ddee84fc161540ac5aeeef5b292f01be3b773f24d3e122f251079d79"
    end
  end

  def install
    bin.install "qoderclicn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qoderclicn --version")
  end
end
