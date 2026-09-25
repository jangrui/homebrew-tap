class QoderCliCn < Formula
  desc "终端原生的 AI 编程搭档,也是可被集成的智能体引擎"
  homepage "https://qoder.com.cn/"
  version "1.1.64"

  livecheck do
    url "https://static.qoder.com.cn/qoder-cli-cn/channels/manifest.json"
    strategy :json do |json|
      json["latest"]
    end
  end

  on_macos do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-arm64.tar.gz"
      sha256 "28933327c582238f74d2db13c1a82040457320602368665a88e44e31633b8374"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-darwin-x64.tar.gz"
      sha256 "d215cf984a84d92b13b855ce3758869300f4cf658f51821c1ba975d6beaf3d25"
    end
  end

  on_linux do
    on_arm do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-arm64.tar.gz"
      sha256 "899c1a743322fd15fe80e83e166fbdea28e620a63019ad2d2b16c8113f4f1592"
    end
    on_intel do
      url "https://static.qoder.com.cn/qoder-cli-cn/releases/#{version}/qoderclicn-linux-x64.tar.gz"
      sha256 "907fd47d1185ea700b5e9bc8cd2cb7e1681af52a58476a3f793c3420c7d2d312"
    end
  end

  def install
    bin.install "qoderclicn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qoderclicn --version")
  end
end
