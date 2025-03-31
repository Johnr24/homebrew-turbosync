# Formula: turbosync.rb
class Turbosync < Formula
  desc "macOS utility for synchronizing directories using rsync"
  homepage "https://github.com/johnr24/turbosync"
  url "https://github.com/Johnr24/TurboSync/releases/download/v1.4.9/TurboSync-v1.4.9.dmg"
  version "1.4.9"
  sha256 "a29e8fec7010c80d7e05be2642f7d6ece1466b51476859ebda77dedbc29acf91"

  depends_on :macos

  def install
    # Mount the DMG, copy the app, and unmount
    dmg_path = "TurboSync-v#{version}.dmg" # Match the actual filename from the URL
    mount_point = "/Volumes/TurboSync v#{version}" # Assuming volume name pattern

    # Debug: List files in the current directory
    system "ls", "-la"

    system "hdiutil", "attach", "-nobrowse", dmg_path
    prefix.install Dir["#{mount_point}/TurboSync.app"].first
    system "hdiutil", "detach", mount_point
  end

  def caveats
    <<~EOS
      TurboSync.app has been installed to:
        #{opt_prefix}/TurboSync.app

      To make it easily accessible from your Applications folder, you can link it:
        ln -sfn "#{opt_prefix}/TurboSync.app" /Applications/TurboSync.app

      Alternatively, you can drag the TurboSync.app icon from the installation directory
      (open "#{opt_prefix}") to your /Applications folder.
    EOS
  end

  test do
    # Check if the .app bundle exists in the installation directory
    assert_path_exists opt_prefix/"TurboSync.app"
  end
end
