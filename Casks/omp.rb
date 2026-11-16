# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.20.3"
  sha256 arm:          "979884efdb84d48ab0401279d3669e71c003922e3e0b50689b8901a4b356e85a",
         intel:        "388fc0dc7609649c7caa7533378ea5673ed8583e501fabafb0179258f609e6c3",
         arm64_linux:  "eaa8c4d324b8a54835b3194ba6cb17f849393dd8142745f3a25f70e982a68aa8",
         x86_64_linux: "f34ec9b0f0c368f1937701e2fe111b3c29a7cf53314a642448b3c6cf2925d85a"

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
