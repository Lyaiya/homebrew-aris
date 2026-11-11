# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.18.8"
  sha256 arm:          "8de03d5f3ef3b37470cacc12539a547ace0152da562ee74a43099ec963a129eb",
         intel:        "b332fab3698384da504c449c5da365d2b631305a8412161a63a1d9dd769ddac2",
         arm64_linux:  "5e4de8d03d543414115480e03d6d232a43cacf25dcb9df8d8f93a44a8a0e7667",
         x86_64_linux: "bfb7a85cceade6e5580fad59ff87570b4de50039b0428ed30339cf4286bd052f"

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
