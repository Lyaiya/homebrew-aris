# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.14.1"
  sha256 arm:          "1cef852c6cb00a86b555efd703efe5192200d302601ff29048e152495362bff9",
         intel:        "eed7a65291c5bb75534e57634e3b7c5c0a5adfc39457977dcd5ddcbaaa0c5cca",
         arm64_linux:  "1fd31f1c9471a3f8417571cba857de0fa2ec1678b93d5251750120baab3460e6",
         x86_64_linux: "02d76a0cfeee473ffa387f50cf0378b0de1c44684c83e67ca27ba4d717cfb0d0"

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
