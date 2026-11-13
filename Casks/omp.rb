# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.20.0"
  sha256 arm:          "2b1309b06a743ae939708f939b63f75c7a436ed08c7953309f0e387e0c793ead",
         intel:        "dcd8387f88d32a599451c21c3f402bdc2364243e9e6e5630ff7eec7a8638c4f6",
         arm64_linux:  "8b5e197db7c58b7ebabf83c6f03597f89bae3a766a84c6481b3a942a125f5e22",
         x86_64_linux: "c8694be8c6e6a1f45e3636dd8a8e9eaa78878ad629a89000b403ec5e456d3f89"

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
