# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.20.2"
  sha256 arm:          "e2de0974ce581bfcf2044ea795c712fa240fdf8304f7bdb4b3d81b154d2b57fc",
         intel:        "4896674a500de3e0aed700077c67739ce6aea5ecd61d100fff174143daca693b",
         arm64_linux:  "7f809e51638c2ace701244923d5ec62485bbafd74db75da742ace30c87a91ebf",
         x86_64_linux: "f34cfa57311ed67a45f01bb1a21519cad4d74875d181316f00fa0cd6a4abcaaa"

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
