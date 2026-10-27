# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.13.2"
  sha256 arm:          "38c3645283ceba06f66462830ae15f27270cc7f84575e40a4c6bd68452a63d0f",
         intel:        "a5b85a584f29c9abf4da8d2b3f9e4763645d55d2bdd6ff1f2d3b45500892f069",
         arm64_linux:  "5a5f3d468a4e77b5570b516a96506046c168ec64922eda1dc4fc8db727d208d3",
         x86_64_linux: "dc499ea63082181a4734e5a197d61f04394e7cc0191ef7ba192d110abca0d6c4"

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
