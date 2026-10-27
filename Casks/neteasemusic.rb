# typed: strict

cask "neteasemusic" do
  arch arm: "arm64", intel: "amd64"
  url_arch = on_arch_conditional arm: "_arm64"

  version "3.1.13,3451"
  sha256 arm:   "174dd785bec770ce1451a8bbef56cc2b89bda9df8e9be2ba2d46e4bc893fec84",
         intel: "0d630ddce7d769f4634ffefa7921e6c94475e65a1b4c374fdd5351da31833b98"

  url "https://d1.music.126.net/dmusic/NeteaseCloudMusic_Music_official_#{version.csv.join(".")}#{url_arch}.dmg",
      user_agent: :fake
  name "NetEase cloud music"
  name "网易云音乐"
  desc "Music streaming platform"
  homepage "https://music.163.com/"

  livecheck do
    url "https://music.163.com/api/mac/package/download/latest?arch=#{arch}&productName=music"
    strategy :json do |json|
      version = json.dig("data", "appVer")
      build = json.dig("data", "buildVer")
      next if version.blank? || build.blank?

      "#{version},#{build}"
    end
  end

  auto_updates true
  depends_on :macos

  app "NeteaseMusic.app"

  uninstall quit: "com.netease.163music"

  zap trash: [
    "~/Library/Application Support/com.netease.163music",
    "~/Library/Caches/com.netease.163music",
    "~/Library/Containers/com.netease.163music",
    "~/Library/Cookies/com.netease.163music.binarycookies",
    "~/Library/HTTPStorages/com.netease.163music",
    "~/Library/HTTPStorages/com.netease.163music.binarycookies",
    "~/Library/Preferences/com.netease.163music.plist",
    "~/Library/Preferences/com.netease.163music.helper.plist",
    "~/Library/Saved Application State/com.netease.163music.savedState",
    "~/Library/WebKit/com.netease.163music",
  ]
end
