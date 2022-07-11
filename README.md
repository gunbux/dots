# chun's dotfiles
a personal collection of my own dotfiles. Feel free to steal them or use them for inspiration!

## setup
dotfiles are installed using [Dotbot](https://github.com/anishathalye/dotbot).
To install, just run `./install`. some configs are not provided by default (ssh)
due to security reasons, feel free to put your own configs to fill out these missing configs.

Here are some details of the setup:
- editor: `[neovim](https://github.com/neovim/neovim/)`/`[vim](https://github.com/vim/vim)`
- shell: `[zsh](https://www.zsh.org)`

## branches
there are a couple of branches in this repo, all for different setups.
- **main**: i run this on most of my main machines, and this is the setup I use the most frequently.
  - OS: Linux
  - Architecture: x86_64/amd64
- **pi**: i run a raspi with pi-top os, a spinoff of raspi os (debian based armhf os).
These are the configs I run on them!
  - OS: [Pi-Top OS](https://www.pi-top.com/resources/download-os)
  - Architecture: armhf

## forking this project
feel free to fork and modify these dotfiles however you want!
If you are new to dotfiles, I recommend checking out this
[lecture](https://missing.csail.mit.edu/2019/dotfiles/) from the missing semester!

if you do decide to fork this projects and add your own dotfiles, remember to update the `install.conf.yaml`
so that dotbot installs the dotfiles in the correct location.