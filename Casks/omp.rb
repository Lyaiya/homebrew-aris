# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.13.3"
  sha256 arm:          "b449d0d0d779a0b2e655f0ce41d5c414a253de71c67b3affc30a6528fc967314",
         intel:        "cfd47dc46d028bbdfc220ccb1fdd40af7a82a4e182cb3c2fd1d66a8c20d90326",
         arm64_linux:  "981f08df6c6344356b31aa696fdd810b8b5fa8c8851ba926d3940e793d47cc3a",
         x86_64_linux: "42d39fa8996fed9f999e26306e60e2fdbea0c0de0d0b2d68feba275f44c41d04"

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
