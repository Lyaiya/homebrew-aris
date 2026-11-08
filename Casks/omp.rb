# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.18.1"
  sha256 arm:          "ce80099f10c5ea4367523767230cb5b920f30cc139b9cf8758c1cc4b2f1f9409",
         intel:        "b4ae3bc731c37469b487d03e633b9bebf4f452fb9d9c61a99fa23f773a1e1724",
         arm64_linux:  "3bd7699fe7ea63a8eb14f27290d9d3c6a56e55388bef6c560cb139d809330528",
         x86_64_linux: "2a75e16550676783b3bc8be0e06513478dd5881efc647954642ab30db8f9be06"

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
