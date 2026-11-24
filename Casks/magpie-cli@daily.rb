# typed: strict

cask "magpie-cli@daily" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4762"
  sha256 arm:          "052fee80be12a6f305cee4f531ab6d667d5316e4b113b68cde597f8dd58b90ff",
         intel:        "2c59dadb930dc0ff5985ba866e377a924a7a9111c4231ab968e79eb5a00b7228",
         arm64_linux:  "bbe0f93dcdc6d647e64e829726779cde0b51ff50d0fc387281d927424ec112e5",
         x86_64_linux: "8bd2f822015a051c3d569370be5c2665db89baa4e4b2d0822d9cc623062bec02"

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
