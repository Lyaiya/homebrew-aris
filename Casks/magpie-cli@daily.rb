# typed: strict

cask "magpie-cli@daily" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4682"
  sha256 arm:          "db4aba40fe72288fa245bb4e410637498a9fe1352f7fcd3e027fcee34b809a3e",
         intel:        "4784c19d8593dce37da9c3f856d5b027b2d7aab062cc3177aac67d5b74ee61dc",
         arm64_linux:  "5a6b516026a36d955ef025adb7d57d8ff77e4846fbdf5174431b3afd93b826d9",
         x86_64_linux: "59ba86a9b132e1fe49110c7343dd40796722d77507e268b22d4b28a9bde23f13"

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
