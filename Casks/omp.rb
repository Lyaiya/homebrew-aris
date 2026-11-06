# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.17.0"
  sha256 arm:          "51f2836f267a8ba6c12cfb50f80e75f0301ccfb1bd53535fc6f9df03199da364",
         intel:        "1d953be66433df725aaf8d70e19d954fd982f67fd022c164a6cfca6d853f1d20",
         arm64_linux:  "a9423fd7a69d869bf514931226b21d4ff55474225f574e2911fec457fc470e68",
         x86_64_linux: "a4ce6001ab1012ca835f4184d675437531bd1ac477a7ba8424ed0b5476e9e4cb"

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
