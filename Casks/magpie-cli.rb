# typed: strict

cask "magpie-cli" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.4572"
  sha256 arm:          "c72227bfc9e10ffa9140769de490ffc1be495c112f4def30dc85163d501415b6",
         intel:        "b8717945e610d57e7a0a8741185c196a5124b9579be95fd268ff0d7e94ac1ba4",
         arm64_linux:  "35a2679f94c0051d3fdf4183a2816265ced95ee0c94cdb3331dbdf9ea91a6b92",
         x86_64_linux: "5b15ba3b5e6fdc3fa0bdb851ae52621aa3ba933cefb7abbf63d53d34a67678e3"

  on_macos do
    depends_on macos: :monterey
  end

  url "https://usemagpie.ai/files/v#{version}/magpie-cli-#{os}-#{arch}"
  name "magpie"
  desc "Terminal-only model gateway for AI coding agents"
  homepage "https://usemagpie.ai/"

  livecheck do
    url "https://usemagpie.ai/api/latest?channel=stable"
    strategy :json do |json|
      json["version"]
    end
  end

  conflicts_with cask: ["magpie-cli@daily", "magpie-cli@latest"]
  container type: :naked

  rename "magpie-cli-#{os}-#{arch}", "magpie"

  binary "magpie"

  zap rmdir: "~/.config/magpie"
end
