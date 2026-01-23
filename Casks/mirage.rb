cask "mirage" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.5"
  sha256 arm:   "2575a0645882726e4dc62ddc00c4d08fa51e9532dc63c4ad17dc469a534d5f41",
         intel: "9e5dff2fbca1a62315e1296d4406982ea7a78958a1b4a8a1dd8ddd0653bb1b3e"

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
