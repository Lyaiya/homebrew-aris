# typed: strict

cask "magpie-cli@daily" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4697"
  sha256 arm:          "c3de56a7fd4bc9a37a5fe0ea2f91e93b7f2cd67bf4aff63813523a510109b167",
         intel:        "63652664322db606ee2c0868e4f93c505bc97c3ddfa42cff57fe4bb0806fef24",
         arm64_linux:  "ab67894232c2fbb7f7bbc6b47fa3e9b54ec919f8130a96e43aace489d919d283",
         x86_64_linux: "bbcb817df8ce862d07485aa862e3c873767b16732421d6c4bf43f409dfda8811"

  on_macos do
    depends_on macos: :monterey
  end

  url "https://usemagpie.ai/files/v#{version}/magpie-cli-#{os}-#{arch}"
  name "magpie"
  desc "Terminal-only model gateway for AI coding agents"
  homepage "https://usemagpie.ai/"

  livecheck do
    url "https://usemagpie.ai/api/latest?channel=daily"
    strategy :json do |json|
      json["version"]
    end
  end

  conflicts_with cask: ["magpie-cli", "magpie-cli@latest"]
  container type: :naked

  rename "magpie-cli-#{os}-#{arch}", "magpie"

  binary "magpie"

  zap rmdir: "~/.config/magpie"
end
