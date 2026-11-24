# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4777"
  sha256 arm:          "0ac263372281f14469a91133cd73eaa79221d4bedfdfecff0c8da4aa7226e150",
         intel:        "76ea41cd189afa812593c2d0a6ba552cf6739c773c85a0a36e2851c2b542df71",
         arm64_linux:  "8ef2e33b152ae027ed3e1a282f0aefd1348dfcd766b66d7e55cadf5db0284e47",
         x86_64_linux: "671632057cff98ebf64412bbe4c736f3090ae43bd6d662e7808840d3db758e4d"

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
