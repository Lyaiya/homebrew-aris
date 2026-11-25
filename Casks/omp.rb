# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "19.2.1"
  sha256 arm:          "43943119837612b2da72250ab7efe22ff8ca239eabebd4f702f34e3a144fdd3d",
         intel:        "4face26750f5679857a606a61df22b1587925d4b308d5938de470d8c780cd871",
         arm64_linux:  "92d4cce4b14814f6b838aa86dcec6359f0cb089cbcc300e8463cbb5326991fe0",
         x86_64_linux: "e8b937f9bf023baa147bdd300ad5421af0a6ef8b1f350c47a9a93d5fca94feca"

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
