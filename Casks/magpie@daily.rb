cask "magpie@daily" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.4762"
  sha256 arm:   "7b26591d64d979c108057272f9c994d526e91fe4e34956679adf148dda2aed61",
         intel: "31b9576f863d45b01eeafa2623ad2daef6121c05e80f590945aadc7ddfafe53e"

  url "https://usemagpie.ai/files/v#{version}/magpie-darwin-#{arch}.zip"
  name "magpie"
  desc "Model gateway for AI coding agents"
  homepage "https://usemagpie.ai/"

  livecheck do
    url "https://usemagpie.ai/api/latest?channel=daily"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  conflicts_with cask: ["magpie", "magpie@latest"]
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

  caveats "For in-app updates, choose Daily in Settings > About > Update channel."
end
