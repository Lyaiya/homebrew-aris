# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4757"
  sha256 arm:          "a97b095b5bf306e186b50113f51e75cdb4047057cffc1ee27bd7fdc707e2d47d",
         intel:        "7becc2f79747a7fe0e3ad2f6f48e5ca688516135445a01720048c4d56f33287d",
         arm64_linux:  "3e9b462e6746c9336b6f1855b5d6ae0cd9b1c357cbf4838c3f3ab3354d34fcc7",
         x86_64_linux: "1553d4a88d62d5d849152374752bfee142d172cd878cc0cafe8546b6666cdc81"

  on_macos do
    depends_on macos: :monterey
  end

  url "https://usemagpie.ai/files/v#{version}/magpie-cli-#{os}-#{arch}"
  name "magpie"
  desc "Terminal-only model gateway for AI coding agents"
  homepage "https://usemagpie.ai/"

  livecheck do
    url "https://usemagpie.ai/api/latest?channel=latest"
    strategy :json do |json|
      json["version"]
    end
  end

  conflicts_with cask: ["magpie-cli", "magpie-cli@daily"]
  container type: :naked

  rename "magpie-cli-#{os}-#{arch}", "magpie"

  binary "magpie"

  zap rmdir: "~/.config/magpie"
end
