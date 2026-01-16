  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.3.7"

    on_intel do
    sha256 "a82220120fcf79d2a2560224c2cc6c70956f1a61e7f54f7467f82cd4c3ad77fc"
      url "https://github.com/veildawn/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/veildawn/conflux-app/"
    end

    on_arm do
    sha256 "3c011848a860f2f27c6ef109a530748f18cae1e77ff80b712545d47f43002778"
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
