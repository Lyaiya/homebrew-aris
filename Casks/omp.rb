# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.19.0"
  sha256 arm:          "d469628ae8b847617087cc987a628868e4cac53deb5f99451c8cfc4eec5e7e8d",
         intel:        "bc2a090133225284e7b8026a75e571fab4ab691532af0540ed2bdc6d1ce8d9aa",
         arm64_linux:  "61826bf89c2c0512417fee05fa2f486e60ee11b23ea95a17257a6c49edb6b8d5",
         x86_64_linux: "b44fda2ae5c9cce2bbe124d1672cba532a136d9e1eef68599b16efcd3bc5c626"

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

  rename "omp-#{os}-#{arch}", "omp"

  binary "omp"
  generate_completions_from_executable "omp", "completions"

  zap rmdir: "~/.omp"
end
