# typed: strict

cask "alt-tab" do
  version "11.10.2"
  sha256 "ebb734ac05bb3628d6b09ced96c036aaade308961b0246f0f9cc9d42d21c284f"

  url "https://github.com/Korel/alt-tab-macos/releases/download/fork-v#{version}/AltTab-#{version}-unsigned.dmg"
  name "AltTab"
  desc "Enable Windows-like alt-tab, unsigned build from Korel's fork"
  homepage "https://github.com/Korel/alt-tab-macos"

  livecheck do
    url :url
    regex(/^fork-v(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "AltTab.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/AltTab.app"]
  end

  uninstall quit: "com.lwouis.alt-tab-macos"

  zap trash: [
    "~/Library/Application Support/com.lwouis.alt-tab-macos",
    "~/Library/Caches/com.lwouis.alt-tab-macos",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.lwouis.alt-tab-macos",
    "~/Library/Cookies/com.lwouis.alt-tab-macos.binarycookies",
    "~/Library/HTTPStorages/com.lwouis.alt-tab-macos",
    "~/Library/HTTPStorages/com.lwouis.alt-tab-macos.binarycookies",
    "~/Library/LaunchAgents/com.lwouis.alt-tab-macos.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.license.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.usage.plist",
  ]
end
