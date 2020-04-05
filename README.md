# Dotfiles

## Usage

### Install

Run this:

```sh
git clone https://github.com/nclsprsn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
cp config/config.sh.default config/config.sh
vim config/config.sh
./INSTALL.sh
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

### Uninstall

```sh
cat ~/.dotfiles/.installed.list | xargs rm -rf
```

And remove the `~/.dotfiles` folder.

## Contributing to the dotfiles

You can discuss using the issues section. To contribute create an issue and send a pull request, see how to send a pull request.

## License

The handbook is available under the Beerware license.
