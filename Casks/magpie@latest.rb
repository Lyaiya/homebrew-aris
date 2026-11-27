cask "magpie@latest" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.4985"
  sha256 arm:   "50a35a5012f669330fc2d5d829c969bc836d4032fc07ddd7633efbc3ea13d468",
         intel: "7b3c18cbff0133a99883dad9805a6af7f4e0a107be454c85228750c81e05c9f7"

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
