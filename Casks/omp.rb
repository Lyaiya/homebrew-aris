# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.18.0"
  sha256 arm:          "0adae2a341a1e6840b00c96ce0b1c9d2e0257b1ea6782e4302e17b717a6ffb0a",
         intel:        "ee7dc4c9697b4dca7c4cc9219c26f771cec3d6848f1ed63592ad5463021bf9f0",
         arm64_linux:  "b394bfbf7c0e0ba82e01913defb5fadf14a6ea5a71ee05348070ab5e40187144",
         x86_64_linux: "ec271e0d7df4c0f57acb6a7a28f8585d46bd050bcef8494f6d33db8a6c0dfbba"

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
