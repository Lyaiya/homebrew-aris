# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.18.5"
  sha256 arm:          "8696ca418df9f50a637d3c866948676cb97abb2968af16ee8905d37ae1e08237",
         intel:        "a04e3d1aea29c56549855c62a7be64a5884a0f841ae16192664882b50756ef84",
         arm64_linux:  "c7f4c1b082d46b3b459c10657a26fcabc4e06ff793a2a0883b4e99ec15b7ebaa",
         x86_64_linux: "cdf72cc81afcb0258d6e471c64211854e7516eb73e5be943a0cf30c19fe0deaa"

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
