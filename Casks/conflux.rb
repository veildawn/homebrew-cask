  # typed: false
  # frozen_string_literal: true

  cask "conflux" do
  version "0.3.1"

    on_intel do
    sha256 "9a045bb60232fbf75c483c214c79e6926eedf0073be07c5e2910178bb4f0f36f"
      url "https://github.com/veildawn/conflux-app/releases/download/v#{version}/Conflux_#{version}_x64.dmg",
          verified: "github.com/veildawn/conflux-app/"
    end

    on_arm do
    sha256 "985537f1b0558b15fd6a2e889734c5492356dc8bb1e26abf2eed82f59f87419e"
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
