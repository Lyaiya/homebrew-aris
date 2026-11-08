# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.18.2"
  sha256 arm:          "a1d696334b64d176832d6bc9f03da0d9227d8eaa9ef625c8cebc9c097d135306",
         intel:        "7a717c265e31959daaa8f25633f1483798b8d02ad774c56e69bd344979786661",
         arm64_linux:  "128e1772b2e01bf7ee83cc6810e7efc1e0a5eda87220bad870322f762a9458ab",
         x86_64_linux: "965cf6038d60603296e41e0cf874ca9116561531f7e296e97ee0a9f84c405e53"

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
