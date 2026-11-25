# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "19.2.0"
  sha256 arm:          "31665fabb4e72f91981f0fa3e3d2ec8f301758cdff9552cc9decd2a9748cd9c4",
         intel:        "e53b43dc78b5a66c4b2b1dea8757e65e4e8ea1fc08e0bcf1464acd8efd177f15",
         arm64_linux:  "1291fb9a26dfaef418f23c255e80c12a464fd0e556e926de3e66e04b07decdb1",
         x86_64_linux: "412fe07570ce802c5971e90a8f69627ec5ee5852cd018fc349ca661061e5b88f"

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
