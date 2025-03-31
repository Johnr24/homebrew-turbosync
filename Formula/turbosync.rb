# Formula: turbosync.rb
class Turbosync < Formula
  desc "macOS utility for synchronizing directories using rsync"
  homepage "https://github.com/johnr24/turbosync"
  url "https://github.com/Johnr24/TurboSync/releases/download/v1.4.5/TurboSync-v1.4.5.dmg"
  version "1.4.5"
  sha256 "ff5e545f5c0bc9697d8d5a3a5cbadeca25a5e5a5a47f91b9145dc0f49d7fae0a"

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
