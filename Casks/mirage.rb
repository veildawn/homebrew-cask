cask "mirage" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.4"
  sha256 arm:   "db297ee0c4ba6c942757e933887e5945b7aa4c391d0877b9b62de57a5b2bb35a",
         intel: "1dde8f35b4feeda3c294f8d21e01e389de896b59b0a9519eb9991dd80691407e"

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
