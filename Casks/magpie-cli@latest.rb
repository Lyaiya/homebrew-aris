# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4685"
  sha256 arm:          "ce0ab139d98faa2c11659d2393573c6f0c581bad10b940ea015a49fbd8dbbcce",
         intel:        "51d31d346fe2af8c13d53c6ac6cfa3dd117a5191d08ade14e63d01842aa91e1a",
         arm64_linux:  "3c22b3545f1227e6a2f617ed12c15e05b0cc54d5775ed2b86a4931e7f3e1e510",
         x86_64_linux: "f20f8c165ff07beb892f9902d5a4280826b8d28811a2c0eda73d6cfec3e371f0"

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
