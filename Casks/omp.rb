# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.12.4"
  sha256 arm:          "6b3137f1f307733f10565499eaeb747ed2f6acdf2319c8af20ace22939f872e3",
         intel:        "1d487928b38ce4b28208b21d4df1e680581dfc70fa6887173dd0c8230a6f4607",
         arm64_linux:  "8c2aa64d280067de81bb40b7ca9f35331c0d0133a6562430c151e3bd855a58ec",
         x86_64_linux: "7cba13c3cf37c3791ac63dfea498fa047408d249a3e39bad37fe882c63bb2792"

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

  zap trash: "~/.omp"
end
