# Homebrew tap for Venes

```sh
brew install lorpaves/venes/venes
```

This installs the [Venes CLI](https://github.com/Lorpaves/venes-cli): the Claude Code plugin, its background helper, and the `venes` command. Then pair the Venes app with `venes pair`.

The plugin keeps itself up to date through Claude Code. `brew upgrade` brings it up to date too, whenever there's a new release.

To release one, tag `vX.Y.Z` in venes-cli, then run `scripts/bump.sh X.Y.Z` here and push.

```sh
brew uninstall venes
```

That takes it all off: the plugin, the helper, `~/.venes`, and the SSH keys phones were let in with. A reinstall only stops the helper, so paired phones stay paired.
