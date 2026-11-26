# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4911"
  sha256 arm:          "5c954a127903f459f0121c55877738ca16bdc99f064d3163d564daa73c91c271",
         intel:        "d07cb3949dab3b46b549ad18e45f72de11b8541f6de7a55e0b88b79ca7691b87",
         arm64_linux:  "ecb51676f1abeb8019cb966a2a6090c92a61364c6d4df1c961bf11c06ed78ec0",
         x86_64_linux: "efd387df4f1174fbc6c22a91302dd73b366f3bc2d2732a6d90fd5280ba9174aa"

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
