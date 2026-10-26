# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.13.0"
  sha256 arm:          "524edc3f12b97fbb069bc4d396dd5d711d18ba03db6f60c1f1309d06db9020e4",
         intel:        "21c0a2f3b974a526754b35084256e1b62213a1347e12885bc4735552d0451144",
         arm64_linux:  "419186e8c52dd5cbedd3bc3647d68803d6f5c515a61849957493391f8e008ef1",
         x86_64_linux: "786f5f7652079d972247e3112baaa828ec87aae7c4c3ead20e997b7b4c99d95f"

  url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-#{os}-#{arch}"
  name "Oh My Pi"
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  container type: :naked

  binary "omp-#{os}-#{arch}", target: "omp"
  generate_completions_from_executable "omp-#{os}-#{arch}", "completions", base_name: "omp"

  zap rmdir: "~/.omp"
end
