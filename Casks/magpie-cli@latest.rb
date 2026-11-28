# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4994"
  sha256 arm:          "b8d42ccdb3c7b04f571eaa5ea11f589bc617ccfeacdbd348061374d35c0de6d7",
         intel:        "24e52235ccd7dd616944739fa7e80a7b655f755d931f1208e6fa4f50583d19c8",
         arm64_linux:  "cdc914423cb137e668c981e3e346c02c34c6739d00d2cb875cf9a5d6a4fd3d3d",
         x86_64_linux: "8e715270e88eda1ebe72f34ab8a267580e509fc57fa0e9135e2725884fde831c"

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
