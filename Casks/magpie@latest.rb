cask "magpie@latest" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.4994"
  sha256 arm:   "3b44aaa06da0325797a4654bd4fe7287c81e7e570cbb69ef70ca3401fecfeec3",
         intel: "b4192f19b1c39a25c6ae425377ab393020f19419efca42e7916a419d693b289b"

  url "https://usemagpie.ai/files/v#{version}/magpie-darwin-#{arch}.zip"
  name "magpie"
  desc "Model gateway for AI coding agents"
  homepage "https://usemagpie.ai/"

  livecheck do
    url "https://usemagpie.ai/api/latest?channel=latest"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  conflicts_with cask: ["magpie", "magpie@daily"]
  depends_on macos: :monterey

  app "magpie.app"

  uninstall quit: "com.yetone.magpie"

  zap launchctl: [
        "com.yetone.magpie",
        "com.yetone.magpie.serve",
      ],
      trash:     [
        "~/.cache/magpie",
        "~/Library/Caches/com.yetone.magpie",
        "~/Library/Caches/magpie",
        "~/Library/LaunchAgents/com.yetone.magpie.plist",
        "~/Library/LaunchAgents/com.yetone.magpie.serve.plist",
        "~/Library/Logs/magpie",
        "~/Library/Preferences/com.yetone.magpie.plist",
        "~/Library/WebKit/com.yetone.magpie",
      ],
      rmdir:     "~/.config/magpie"

  caveats "For in-app updates, choose Every version in Settings > About > Update channel."
end
