# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.12.2"
  sha256 arm:          "abd9a5b0fef77f4204078e348e233faa0dd3d5d81719cf2b6a9b9478c10eee48",
         intel:        "dcd3fa827ae73bdb471bb838171ef1c9c5be665a68eaec45ffc6d6e5cf128b92",
         arm64_linux:  "967d64fce514586e94c9ac5f978743b4fce29b999c8763747ce4754811407d1a",
         x86_64_linux: "9513ef9f19d7991aac6ae0cb6077bcf16662092ddde861c002a91cedc6f47f9a"

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
end
