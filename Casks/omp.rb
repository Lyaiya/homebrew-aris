# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.12.5"
  sha256 arm:          "5e50df9879de9165d5c6df5e48bb5d038737270013cd849e189da7774fb7368b",
         intel:        "a42c5c5f04b8dadae553f1dfdb896d57baa9a26a9ae2265aa54341e6c6759c23",
         arm64_linux:  "0af1895adb1ae330e3b58de13d627277efeaaae6e322c3792fd8e6bd9db9aaa1",
         x86_64_linux: "fdbc8136084c9a10439569157b2af62312e2b0d801cab54c73e89476da798e7e"

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

  binary "omp-#{os}-#{arch}", target: "omp"
  generate_completions_from_executable "omp-#{os}-#{arch}", "completions", base_name: "omp"

  zap rmdir: "~/.omp"
end
