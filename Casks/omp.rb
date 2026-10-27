# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.13.1"
  sha256 arm:          "f9c66e8725cf132a6de31b2321908ae1c43c668de12c91deaf368d25c01947d8",
         intel:        "96de0e3b42231f0e5b00333005f413dd97a76160da0d54df299eb0302e0522f7",
         arm64_linux:  "803db725f9e5bd177ce5274f7718081481f367829f773d984a0a9611f4713244",
         x86_64_linux: "ee2961c7da02e514a2475ee958c2fd85dbabf4d0907949ba5022edb2951f84b5"

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
