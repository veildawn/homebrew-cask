cask "mirage" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.5"
  sha256 arm:   "0800fed61eab35deba44458d7e4a27b70dcacbfdf0004da003f4ad5fa8570b3a",
         intel: "7d691004041f47978b96bcf4a8f19c2fe09ac0ab3c81700d9ef99c0455d222c7"

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
