# typed: strict

cask "tty7" do
  arch arm: "arm64", intel: "x86_64"

  version "26.10.0"
  sha256 arm:   "afb33139b6f72b8a127856162a05921cb6fdcbfbeac0afc76abc6d6bdae25c62",
         intel: "bd14d80f5bed5d5f42d96ed4fb0084536391e4c766effd7d714db5315e754fb2"

  url "https://github.com/l0ng-ai/tty7/releases/download/v#{version}/tty7-#{version}-macos-#{arch}.dmg"
  name "tty7"
  desc "Terminal workbench with persistent sessions and remote access"
  homepage "https://tty7.io/"

  livecheck do
    url :url
    regex(/^v(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  conflicts_with cask: "tty7@nightly"
  depends_on :macos

  app "tty7.app"
  binary "#{appdir}/tty7.app/Contents/MacOS/tty7"

  uninstall quit:   "com.github.tty7",
            script: {
              executable: "#{appdir}/tty7.app/Contents/MacOS/tty7",
              args:       ["server", "stop"],
            }

  zap trash: "~/Library/Preferences/com.github.tty7.plist",
      rmdir: "~/.config/tty7"
end
