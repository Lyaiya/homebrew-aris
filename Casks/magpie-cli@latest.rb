# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4839"
  sha256 arm:          "9b3b1731c41aa01fcb5b66e07820e327f710301fdc0697df5c66bcc67bba365a",
         intel:        "270b494e4bf0fba7d154540d6e6af00968ed6326182f8d42b76f35429b841603",
         arm64_linux:  "c8f961f42eefc595a0bde5cd5d69e8ac0bccc40aa43f703136c65c9847b9e6a2",
         x86_64_linux: "db6b29345057e0122e77f7a1fe874b9d372817f1fd0ee728d00e4f1bd45f39ec"

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
