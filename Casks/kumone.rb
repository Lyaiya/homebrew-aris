# typed: strict

cask "kumone" do
  version "0.3.38"
  sha256 "e9bc1798dbee147dd9d0331d36a8e308fecb89738b7f43e1dcb4c4195e11939a"

  url "https://github.com/missuo/kumone/releases/download/v#{version}/Kumone-#{version}.zip"
  name "Kumone"
  desc "Native client for NetEase Cloud Music"
  homepage "https://github.com/missuo/kumone"

  livecheck do
    url "https://github.com/missuo/kumone/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Kumone.app"

  uninstall quit: "sb.moe.kumone"

  zap trash: [
    "~/Library/Application Support/Kumone",
    "~/Library/Caches/com.apple.nsurlsessiond/Downloads/sb.moe.kumone",
    "~/Library/Caches/Kumone",
    "~/Library/Caches/sb.moe.kumone",
    "~/Library/HTTPStorages/sb.moe.kumone",
    "~/Library/HTTPStorages/sb.moe.kumone.binarycookies",
    "~/Library/Preferences/sb.moe.kumone.plist",
    "~/Library/WebKit/sb.moe.kumone",
  ]
end
