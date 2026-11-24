cask "magpie@latest" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.4777"
  sha256 arm:   "22b19bc89830c062d461642cdc446970c2a3a3d921f427de147a40eabf05245f",
         intel: "5c6dd6299c30da2537369615efc1988cb3ed25d1580897e511a66f7e23989dfc"

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
