  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.3.7"

    on_intel do
    sha256 "dfac47107ed76d751d4d62514c3813a1d9db2b73fed97eb633af2ca9fce06485"
      url "https://github.com/veildawn/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/veildawn/conflux-app/"
    end

    on_arm do
    sha256 "66aa16c104cfc0cb1aceb055cc3755c4dfaf6de83a4504777d80bc420c78f283"
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
