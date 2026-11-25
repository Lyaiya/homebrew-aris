cask "magpie@daily" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.4794"
  sha256 arm:   "a304dbd87d1741779efa8177ff452d1e8cafeca9c5d5c7597f008314b586c683",
         intel: "489a92ecf49924eb51891a447ed6e54a6e230e49ac6d2f44b68902ef3feea22c"

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
