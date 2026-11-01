# typed: strict

cask "omp" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "18.15.0"
  sha256 arm:          "d36dfabf0ee52d6f08efadb59c46f0349545c6f6975522417adae29646e73e34",
         intel:        "dc86c67ff66418403dcf62a62bf8129fae8f24e50a1b4099716c8d36914fe204",
         arm64_linux:  "6d7d65030ba562d73cb0687b9710e0ac597b362a185d1911e7b211706dadd4ac",
         x86_64_linux: "6737ee2415555a3656cc7b89c14d1c25c18658ee4c0fd4f7309705149ccb7b0f"

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
