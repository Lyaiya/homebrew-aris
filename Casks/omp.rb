# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "19.1.1"
  sha256 arm:          "d5a3324acd98375a01698a1b0c018be48caed2956c8aa9044ad137fe43bc0400",
         intel:        "6ffecb22a9fe01a98f90f91a2ef04a697850a23bf4dde83adad2fe80e51a8353",
         arm64_linux:  "f022f720c4899eb24c6e5e34dcbbae98ae05f5532bb03e97dffc02cfc8dd9a6f",
         x86_64_linux: "04e9490f9394da6d6804474cc2e41eb3d18f8e26215df4b34bdd4ad4c0d8a401"

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
