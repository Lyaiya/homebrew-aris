# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.22.2"
  sha256 arm:          "d02253f9f5e13bafa2af6a6a773cf7531019d37379b073a204b1be128b961458",
         intel:        "f534936d69a3e0a75ac48d1a53c078c605f1c5646d25eeba4dbae31a1aeae43b",
         arm64_linux:  "82a880ba04d73f1c81a12931447f9f9ed8945581998564eae900c1238f4502e2",
         x86_64_linux: "80a692c5adb9c71124bb11e77bd7edb3cf8fbbab6980db3206dcb6a4cb2905b5"

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
