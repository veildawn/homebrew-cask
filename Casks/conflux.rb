  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.3.2"

    on_intel do
    sha256 "bcee5905036454cd3681cec98c5978dd037a4a2446501d2ba6f2562a50edbf10"
      url "https://github.com/veildawn/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/veildawn/conflux-app/"
    end

    on_arm do
    sha256 "56d2847390fdc6d21e80e02ac57ffc159af5cb42998d9135d7f8179e85cde325"
      url "https://github.com/veildawn/conflux-app/releases/download/v#{version}/Conflux_#{version}_aarch64.dmg",
          verified: "github.com/veildawn/conflux-app/"
    end

    name "Conflux"
    desc "Modern proxy management app based on MiHomo"
    homepage "https://github.com/veildawn/conflux-app"

    livecheck do
      url :url
      strategy :github_latest
    end

    app "Conflux.app"

    postflight do
      system_command "/usr/bin/xattr",
                     args: ["-rd", "com.apple.quarantine", "#{appdir}/Conflux.app"],
                     sudo: false
    end

    zap trash: [
      "~/Library/Application Support/com.conflux.desktop",
      "~/Library/Caches/com.conflux.desktop",
      "~/Library/Preferences/com.conflux.desktop.plist",
      "~/Library/Saved Application State/com.conflux.desktop.savedState",
    ]
  end
