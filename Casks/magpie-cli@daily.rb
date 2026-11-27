# typed: strict

cask "magpie-cli@daily" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4984"
  sha256 arm:          "a061466577e84d60d4e7a65d3ca19edae4f6da38442c83ea51e506cc5e3f0669",
         intel:        "acea4bb844a5227fb4de2d165069d85fcad10cdc61a18138b7bab58ddff307dc",
         arm64_linux:  "b09fb1202b9c8b90d9e3808464c1262f9672f51dd488caa3a07743df7a9af32d",
         x86_64_linux: "6273f70947564e2922f8900a5ecc87714d8523968486500bb6464b51dcde2458"

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
