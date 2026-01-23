cask "mirage" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "c46516766a7d1d2fa7f82971b7f8cecb49d4a404d83739b707a25c8bf5245657",
         intel: "050a6de1672277376e99b1bcf0afb9433d825e59774761284c89fd184fa862be"

  url "https://github.com/veildawn/homebrew-cask/releases/download/mirage-v#{version}/Mirage_#{version}_#{arch}.dmg"
  name "Mirage"
  desc "Android device mirror and control tool powered by scrcpy"
  homepage "https://github.com/veildawn/mirage"

  app "Mirage.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Mirage.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.veildawn.mirage",
    "~/Library/Caches/com.veildawn.mirage",
    "~/Library/Preferences/com.veildawn.mirage.plist",
  ]
end
