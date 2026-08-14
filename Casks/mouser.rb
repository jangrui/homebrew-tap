cask "mouser" do
  version "3.7.3"

  on_arm do
    sha256 "030841812b004a4e2416ac3c177c4de60bc17cb08910b9402d72d9b174ed2da7"

    url "https://github.com/TomBadash/Mouser/releases/download/v#{version}/Mouser-macOS.zip"
  end
  on_intel do
    sha256 "7780a3255dd9a611c138f8f3e953a88bcd169fd1732a66586d5ed396342e55ca"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Mouser.app"]
  end

  zap trash: "~/Library/Application Support/Mouser"
end
