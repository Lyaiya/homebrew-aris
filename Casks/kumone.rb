# typed: strict

cask "kumone" do
  version "0.3.37"
  sha256 "177088a73f55f3f722b5ada14152c4b0c9ee6467ad035ed26d3fb4a1702c570b"

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
