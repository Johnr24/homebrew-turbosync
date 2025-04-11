cask "turbosync" do
  version "1.6.2"
  sha256 "863b273550e3dd5e2f65b5a55ff1ae477efe247aedb4d08f0df40dfc12cb2392"

  url "https://github.com/Johnr24/TurboSync/releases/download/v1.6.2/TurboSync-v1.6.2.dmg",
      verified: "github.com/Johnr24/TurboSync/"
  name "TurboSync"
  desc "macOS utility for synchronizing directories using rsync"
  homepage "https://github.com/johnr24/turbosync" # Using the homepage from the previous formula

  # Assuming TurboSync.app is directly inside the DMG root
  app "TurboSync.app"

  # Add minimum macOS requirement if known, e.g.:
  # depends_on macos: ">= :catalina"

  # Optional: Add zap stanza for uninstall cleanup if needed
  # zap trash: [
  #   "~/Library/Application Support/TurboSync",
  #   "~/Library/Preferences/com.yourcompany.turbosync.plist", # Adjust identifier
  # ]
end