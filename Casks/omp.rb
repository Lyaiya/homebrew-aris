# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.14.0"
  sha256 arm:          "608843959ab34295d52460dd09dd7d548b6c903c08a83c67954c2d4c36fd1f5a",
         intel:        "fc119dff47f99569e32b0a2b10c25db9733ac6faef6ca005539b6e6f610e5984",
         arm64_linux:  "dba8d170499709bc87359e02e677821aa76a6ef998ca0254578fe4ea07aff5bc",
         x86_64_linux: "e7dd2b606c4ebe9d1a7bcfad1b8820db968cd6b05409fed1c6bc8db0b6a95a8f"

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
