# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4743"
  sha256 arm:          "12e382fa8ca435d9958b8535937a48a85c055e091bd3dc679a466d61754ef44e",
         intel:        "fd539456d5c38ade33c9ee1ec81378f880083b2ec2c4479ceaa038b7d1e7878f",
         arm64_linux:  "298c92c20583729b53b616024bddf6619cbbfba2215e62d9ed47308357f56ae1",
         x86_64_linux: "10f1b331c26bef2937080068751014b734427ca9ae44e2904fdffcb46e9f40a1"

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
