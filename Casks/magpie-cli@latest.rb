# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4939"
  sha256 arm:          "f626ea6ce1831a5d2bd11bad6e1bc569615ecfdb3e6750015bae215f6b32f1f1",
         intel:        "4e4c71606e0b8262b2f3f3fee2cbbd9813441467145ee64e11252bd38306449c",
         arm64_linux:  "2df8438953d0ae94c1558206096ced2b22742d95edbed3cb774d3c0c74c196bf",
         x86_64_linux: "fc1838d806871ded4c70fb5c7d92abdb65b5642b0ddd13c4938f187f8976aefd"

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
