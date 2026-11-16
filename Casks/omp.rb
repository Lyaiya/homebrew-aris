# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.22.0"
  sha256 arm:          "d185113d63eba23925e5d70ab661a424b827c06c98f8e766c3bf4ad62ddaff9a",
         intel:        "a1933196fe54bac3d518ccf7e5cc11849dd207b710cda431c465a12d173ff035",
         arm64_linux:  "7238dd213d5c61bc9bf51735d552bc71901fdd44329f862b0a971146b1cdac3e",
         x86_64_linux: "f706b27ba845834d8f8360705a2e9ba1534f3593fa24411d41358272de33642b"

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
