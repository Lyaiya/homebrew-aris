# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.18.6"
  sha256 arm:          "ed2e63eb43888eb76cb1409b245b1db4557c94dfad52dc545c9aaca01ebce82d",
         intel:        "836fea57b1dfcf53c26053aef3d57b6d1f83ec034a7f8b25d789022c5adbc365",
         arm64_linux:  "aa9d69380f7ded098bcd3d8023a67edcc8fc3cc0529360a98dededc21cfa101b",
         x86_64_linux: "a8059b95de5eaba0b3fb6f7182842d661feae29cb2931cdbeba2986db4751ecb"

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
