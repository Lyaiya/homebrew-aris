# typed: strict

cask "magpie-cli@latest" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4985"
  sha256 arm:          "bbdd6a40815411920f9009471ce9032e88b4f085d79cca46be63a3ea2e93b19d",
         intel:        "533efcabbe9500c77976439d7c7c74682564650b52ae28e267dffd68ff495c4e",
         arm64_linux:  "d23e870d16314d9605f6452d07d04b7e88799c92432d86bb31b3a143130783dd",
         x86_64_linux: "a5c2be492da9e9431523cd8ce5f3fc4a2a6fff382a7c3866a51e6988fa63a4af"

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
