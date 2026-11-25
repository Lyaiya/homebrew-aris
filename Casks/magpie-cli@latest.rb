# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4820"
  sha256 arm:          "6f72760b64359e6204cb140b67eee202f4518cea30b562b7531746a852dc2b76",
         intel:        "4d64dc75e9a9d0ab8149d9eab6a6db32e08316c4294f0f8a7f7cebbca69d70f7",
         arm64_linux:  "ed4273082de6ac66ec3c4794a01d0a41712636c4b2537f5d34c25fc5b755d99a",
         x86_64_linux: "eff23ffa82cc0dca2845de17a8c9ac06f1561aafa03481a4d5cc04beefa8e451"

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
