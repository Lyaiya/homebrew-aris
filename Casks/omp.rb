# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "19.0.0"
  sha256 arm:          "a5ee90b2ffcc0c1f031dbd4bedd4ff8e0c884ec8e69b700f4c5d76a1eae89daf",
         intel:        "bbb3e9333c31fa5b892ce353dc678e7a67c25667307f5400ea07bd928163fb29",
         arm64_linux:  "6301041309d9bb26c19576ab116d828dba9c74654507cfa3594d62d310864626",
         x86_64_linux: "c7cc5c8d505053c8ffaf180417e5d5c781235b9d936f286810560151120109bf"

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
