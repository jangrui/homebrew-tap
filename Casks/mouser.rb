cask "mouser" do
  version "3.7.1"

  on_arm do
    sha256 "d559db2dcff0bcbd29920a9dd51045cd33ba2c9272560cea5919d80bb136b75c"

    url "https://github.com/TomBadash/Mouser/releases/download/v#{version}/Mouser-macOS.zip"
  end
  on_intel do
    sha256 "fd7d204af0f9c5a154efe15c9f24a9ca2d29e29099f9101c75c120e8d08f7094"

    url "https://github.com/TomBadash/Mouser/releases/download/v#{version}/Mouser-macOS-intel.zip"
  end

  name "Mouser"
  desc "Logitech Options+ 开源替代品,HID++ 鼠标按键重映射 + 按应用配置"
  homepage "https://github.com/TomBadash/Mouser"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: :monterey

  app "Mouser.app"

  zap trash: "~/Library/Application Support/Mouser"
end
