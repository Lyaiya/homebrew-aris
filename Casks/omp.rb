# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.22.1"
  sha256 arm:          "6bf784a1ae1d3815116019372af27beb9192e1962e939be35643f6712d257c5b",
         intel:        "b2f04268a036718bff475a95fbcafb360f3b48bafdcc40b3351aaaeb36ef62a2",
         arm64_linux:  "c65dd594ba33efd53274fa3b766bd31f67c070717fac12f9e604d2b5b5469bf9",
         x86_64_linux: "ba2d380bc54a6f175a314b49d2f45e82d45e469274362969afbadf2d65423fd6"

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
