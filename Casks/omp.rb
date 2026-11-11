# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.18.9"
  sha256 arm:          "493060f672eb152d85afeb51451b62b4acbd68b8c4071c96e9e3226e15a7251c",
         intel:        "3360b445d8a4ff9632b09839eed997e502233468e868feba3a7eeb73242b00b9",
         arm64_linux:  "81c978db22a0c1fc27e49d99196dd4979ff7604151f4b0924d5581733622f86b",
         x86_64_linux: "942a0c59a13a2eccffceab551e73ca9a5a148d69ae6320b7bfa1a7a130aafad3"

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
