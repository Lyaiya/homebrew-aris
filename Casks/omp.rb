# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.12.6"
  sha256 arm:          "cfbb5e38cd8f8a3be55e710700be587d287deaacdc58c9b0a661c5086bccfe58",
         intel:        "62d6e6fd88b6fa5de2ca82842906f152bf1aa227559b1d0bb386f25f6d606123",
         arm64_linux:  "eee8e586274cef2e725c218b2b28b48ca9965d46dd58f60998cb347eca4ad0cf",
         x86_64_linux: "85d9daf3a05fc76e8cd425ae1904eb576af8d21cc85fcf4690742626e07ccfa4"

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
