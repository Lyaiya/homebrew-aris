# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.14.2"
  sha256 arm:          "9b7bda0bd8ec8d1fd8f8deda076180deef2d4921ee60e7d2f39044ee7d9437ee",
         intel:        "62835e51acc0f07d19493da736b7215d3224fd5099754b7e42c3b0fdc2eb7f45",
         arm64_linux:  "afbdf04be3ddbe34a07e91c913ddb6d335a3a0210f520ac5a197a245888ad63e",
         x86_64_linux: "cde0bc4ac8ec333c4880039a5242ff33dbfc6544747d67aeb99bb077874aeec1"

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
