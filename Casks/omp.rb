# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "19.1.0"
  sha256 arm:          "dca5643669ed5e553f707bd065499babd0fe3030696bbb24c9da09c798af5abb",
         intel:        "edf51e3754f3f145298ae6dbfd9e6d5f5ec178e3386f043959ec71f7981c52af",
         arm64_linux:  "785e8e519acb55852a85e5495271d768a221ca92c095c043cd3eb0d7f8d3eafc",
         x86_64_linux: "be2b45c437b623e15c29b1f8c98aacb842f92118196454b5e9eed884359e9a01"

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
