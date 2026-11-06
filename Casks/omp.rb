# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.16.0"
  sha256 arm:          "d4a10d97488d6054d2b18198bd24f461079952c7e0fb75ba66336ca0df0cb99e",
         intel:        "abd62d315b66314f0f635d537407037e7b0d06782513d8035669db5ef744242d",
         arm64_linux:  "c2be1ea85ce17c4270854b57efff2a7ea1d5a03c7557fd08721f2b9bb32698de",
         x86_64_linux: "6498ed785bab00d2926e0387e0ec02362d6d45f1c3d0d1b57c1618b7f95c9264"

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
