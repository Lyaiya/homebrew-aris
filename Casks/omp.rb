# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.20.1"
  sha256 arm:          "2a080bfd790309001ea001140382a5850be284e984c2f8678a81a41a37e77490",
         intel:        "33718063c971cdfd3b249fd13d6821935d78ec18608c3d9c33491c0a3a3a251c",
         arm64_linux:  "21305158dbdecfa771b72a62254831d60be6b96726245877c25324a4b9988f76",
         x86_64_linux: "24bef5a44d6db0d8f6e8f677404b9a7f1dde3c5e500c435290a3be71bb4dec2a"

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
