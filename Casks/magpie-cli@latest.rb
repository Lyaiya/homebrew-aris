# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4783"
  sha256 arm:          "c76953011579ddae3c62111d4effbb5770d78a1b223e94f50b1c25c0fa644d60",
         intel:        "43b4bf52dad915def3b7860fd2a18c327ac55d6ff2388597bd0334c62b9fd1c6",
         arm64_linux:  "6ec706773fc0459ca0efad1419cd5fdab01ba9f83ad352133dc5ec1164e35a4e",
         x86_64_linux: "e189114600daaeebbf4e70862fb513a81fbccec1e3d5f80061fb6349fc7f02cb"

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
