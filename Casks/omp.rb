# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.22.1"
  sha256 arm:          "967a17c31ee42063c02cef14359e002d6246266f645a5dc781d775e934a5168f",
         intel:        "82849acf9b4ee0a0b6ae4671c93f1471072fd7eb4a19282b695b378206d57f11",
         arm64_linux:  "6bc4d32db3b7031abd479abcd2fd6be54f45906e36b91a51c5b1683a3b584331",
         x86_64_linux: "98613e875930032d43c2f74e6141220a01a48ff76ac5c2e03198a68faa6e0d96"

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
