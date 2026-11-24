# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4730"
  sha256 arm:          "135c5b007bb4c1befc7525b8cae434731450d576b8ee6d2cd411237f8222eab0",
         intel:        "6e5a38f38db350f13a66d5dd29cbd5b7a460be4de0f9fc7276ccc14e66c53aa5",
         arm64_linux:  "d7f5da5e8403daead2373b4235887fff947c084f1f2b3e50c8a70240f715478a",
         x86_64_linux: "2656e1ff24c0ef2a7bd527c73f849d7e0892cf660cd3671c653af2babd1aae3a"

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
