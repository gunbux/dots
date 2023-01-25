# chun's dotfiles
a personal collection of my own dotfiles. Feel free to steal them or use them for inspiration!

## setup
dotfiles are installed using [Dotbot](https://github.com/anishathalye/dotbot).
To install, just run `./install`. some configs are not provided by default (ssh)
due to security reasons, feel free to put your own configs to fill out these missing configs.

Here are some details of the setup:
- wm: [`bspwm`](https://github.com/baskerville/bspwm)
- compositor: ibhagwan's fork of [`picom`](https://github.com/ibhagwan/picom-ibhagwan-git)
- bar: [`polybar`](https://github.com/polybar/polybar)
- launcher: [`rofi`](https://github.com/davatorium/rofi)
- editor: [`neovim`](https://github.com/neovim/neovim/)/[`vim`](https://github.com/vim/vim)
- shell: [`zsh`](https://www.zsh.org)
- terminal: [`alacritty`](https://github.com/alacritty/alacritty)
- notifications: [`dunst`](https://github.com/dunst-project/dunst)
- music player: [`ncmpcpp`](https://github.com/ncmpcpp/ncmpcpp)


## branches
there are a couple of branches in this repo, all for different setups.
- **main**: i run this on most of my main machines, and this is the setup I use the most frequently.
  - OS: Linux
  - Architecture: x86_64/amd64
- **pi**: i run a raspi with pi-top 4 case, running pi-top os.
These are the configs I run on them!
  - OS: [Pi-Top OS](https://www.pi-top.com/resources/download-os)
  - Architecture: armhf

## configs and inspiration
my linux configs are a modification of archcraft's base configs.

my vimrc is a frankenstein vim config with settings taken and modified from [amix](https://github.com/amix/vimrc),
[brodie](https://github.com/BrodieRobertson/dotfiles), and [chris@machine](https://www.youtube.com/watch?v=gZCXaF-Lmco)'s
configs with very sane defaults and settings. I've kept it intentionally in vimscript instead of lua so you
can use it with both vim and neovim.

on my pi, i'm running the zsh configs taken directly from the default kali linux [configs](https://gitlab.com/kalilinux/packages/kali-defaults/-/blob/kali/master/etc/skel/.zshrc), as a really like the defaults and the tiny one file config.

## forking this project
feel free to fork and modify these dotfiles however you want!
If you are new to dotfiles, I recommend checking out this
[lecture](https://missing.csail.mit.edu/2019/dotfiles/) from the missing semester!

if you do decide to fork this projects and add your own dotfiles, remember to update the `install.conf.yaml`
so that dotbot installs the dotfiles in the correct location.
