# Formula: turbosync.rb
class Turbosync < Formula
  desc "macOS utility for synchronizing directories using rsync"
  homepage "https://github.com/johnr24/turbosync"
  url "https://github.com/Johnr24/TurboSync/releases/download/v1.4.7/TurboSync-v1.4.7.dmg"
  version "1.4.7"
  sha256 "670d47c547cb0542195ccdb2704663e66a631c4f07a051acc02e28b119f9b6f5"

  depends_on :macos

  def install
    # Mount the DMG, copy the app, and unmount
    dmg_path = "#{name}-v#{version}.dmg" # Use the downloaded DMG filename directly
    mount_point = "/Volumes/TurboSync v#{version}" # Assuming volume name pattern

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
