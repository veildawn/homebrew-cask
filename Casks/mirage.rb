cask "mirage" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.6"
  sha256 arm:   "3ac23271ce372d4a50275092b2ee21c564118bc861f1ca8be74c881ec97934da",
         intel: "aea5530f7efb53ee354f3f119566a6f8465d89cd2fb51e720d6c2cb4620531c0"

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
