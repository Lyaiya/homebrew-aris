cask "wezterm-weekly" do
  version "20261010-083911-e2a98e1b"
  sha256 "0115f1b0046258f653e2823c7ba9e7555d5cad6e40f06b0ce2d7615405f84fe9"

  url "https://github.com/Lyaiya/wezterm-weekly/releases/download/#{version}/WezTerm-macos-#{version}.zip"
  name "WezTerm Weekly"
  desc "GPU-accelerated cross-platform terminal emulator and multiplexer"
  homepage "https://github.com/Lyaiya/wezterm-weekly"

  livecheck do
    url :url
    regex(/^(\d{8}-\d{6}-[0-9a-f]+)$/i)
    strategy :github_latest
  end

  conflicts_with cask: ["wezterm", "wezterm@nightly"]
  depends_on :macos

  # Move "WezTerm-macos-<date>/WezTerm.app" out of the subfolder
  rename "WezTerm-*/WezTerm.app", "WezTerm.app"

  app "WezTerm.app"
  %w[
    wezterm
    wezterm-gui
    wezterm-mux-server
    strip-ansi-escapes
  ].each do |tool|
    binary "#{appdir}/WezTerm.app/Contents/MacOS/#{tool}"
  end

  bash_completion "#{appdir}/WezTerm.app/Contents/Resources/shell-completion/bash", target: "wezterm"
  zsh_completion "#{appdir}/WezTerm.app/Contents/Resources/shell-completion/zsh", target: "_wezterm"
  fish_completion "#{appdir}/WezTerm.app/Contents/Resources/shell-completion/fish", target: "wezterm.fish"

  zap trash: "~/Library/Saved Application State/com.github.wez.wezterm.savedState"
end
