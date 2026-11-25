# typed: strict

cask "magpie-cli@daily" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4794"
  sha256 arm:          "495cf95d6294f21ed30c4511b6ff847213b7ed33002ce0a5edd7728aedf7d082",
         intel:        "b13788a54dfe085211df575703e490d950b81b46513b07816e074938c8bd1b78",
         arm64_linux:  "531ebb7e4bc0daf2e7da1690b08f121bef84b5b9724eab9beca7dd99153f9fb3",
         x86_64_linux: "6d3d6a12acf7318b1bb0d8a020ccbf924407523137e59989b43ac69ad73778e0"

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
