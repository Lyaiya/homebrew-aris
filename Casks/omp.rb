# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "19.0.1"
  sha256 arm:          "2fe420bbd00f81899816e51cbeeb9593afa59d9368d62c9d3e78535d540e32f6",
         intel:        "8d62502eede8c7a43311798434d0a31a1c024a3abc56bedc4da200cccf94fea1",
         arm64_linux:  "237ede0f4994d61f523802c4cf562d4e48bae74c188add792d06d051b907cecf",
         x86_64_linux: "6ceef04430851bb1050c6fda3af467412eb44a11df0a6ff8121fe601013c5415"

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
