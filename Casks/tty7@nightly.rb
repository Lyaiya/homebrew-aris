# typed: strict

cask "tty7@nightly" do
  arch arm: "arm64", intel: "x86_64"

  version "26.10.1-nightly.202611202336"
  sha256 arm:   "e79f9461c0dfda971de0f0a67b62c83af5e1a0e44240e87aa1efcb10f2821094",
         intel: "4401ea2f941753ab8380cf788774080316222ef581d7ed85c08d521b4fdc2997"

  url "https://github.com/l0ng-ai/tty7/releases/download/nightly/tty7-#{version}-macos-#{arch}.dmg"
  name "tty7"
  desc "Terminal workbench with persistent sessions and remote access"
  homepage "https://tty7.io/"

  livecheck do
    url "https://github.com/l0ng-ai/tty7/releases/download/nightly/nightly.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  conflicts_with cask: "tty7"
  depends_on :macos

  app "tty7.app"
  binary "#{appdir}/tty7.app/Contents/MacOS/tty7"

  uninstall quit: "com.github.tty7"

  zap trash: "~/Library/Preferences/com.github.tty7.plist",
      rmdir: "~/.config/tty7"

  caveats "For in-app updates, choose Nightly in Settings > General > Updates > Update channel."
end
