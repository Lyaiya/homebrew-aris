# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4708"
  sha256 arm:          "55cf2b9692f017bfa63ef963b04d0c6ecf984f14dfefc46246990ef75e5b44a9",
         intel:        "42d8133a8714bc9f641788b89a707344fae1d274b5e7b1c4256970c254a1c33e",
         arm64_linux:  "2d5861af8f55dc08a4a47aceb7614c418a44ea0f37c1d037faebcebdac7fc0df",
         x86_64_linux: "25975b889a54a6aa1c5656020f36a1f7ba14402f8e7087a70d371cb8cfa9a754"

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
