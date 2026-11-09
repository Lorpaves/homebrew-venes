cask "venes" do
  version :latest
  sha256 :no_check

  url "https://github.com/Lorpaves/venes-cli/archive/refs/heads/main.tar.gz"
  name "Venes CLI"
  desc "Follow and answer Claude Code sessions from the Venes iPhone app"
  homepage "https://github.com/Lorpaves/venes-cli"

  # The plugin keeps itself up to date through Claude Code.
  auto_updates true
  depends_on formula: "node"

  installer script: {
    executable: "venes-cli-main/install.sh",
  }
  binary "venes-cli-main/bin/venes"

  # A real uninstall takes everything off; a reinstall or an upgrade only stops the helper.
  uninstall script: {
    executable:   "venes-cli-main/scripts/brew-uninstall.sh",
    must_succeed: false,
  }

  zap trash: "~/.venes"

  caveats <<~EOS
    Pair the Venes app with:
      venes pair

    Claude Code sessions that were open before need a restart, or /reload-plugins, to be seen.
  EOS
end
