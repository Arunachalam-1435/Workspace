## Introduction
This is a small Bash script that installs and configures `Neovim` and `Tmux` with some simple customization plugins. It is very useful for people who want to setup `Neovim` and `Tmux` in a single command, without getting any weird error and configuration mistakes. Now we see how the script works and what are the plugins it install and configure in your machine.
## ⚠️Before running the script
1. This script only runs on `Debian` based distros, because it use `APT` package manager. 
2. This script runs only downloads and setup `Neovim` for `X64` based systems. Not `ARM` based machines.
3. Also it is a `Bash` script. So your shell should be `Bash`.
4. Make sure you don't have existing `Neovim` and `Tmux` installation. If you have it, this script will over write the existing configuration. So backingup the existing configuration is mandatory.
## ▶️To run this script
```bash
git clone https://github.com/Arunachalam-1435/Workspace.git
chmod u+x setup.sh
./setup.sh
```

Then test the installations using,
```bash
nvim
```
For `Neovim`
```bash
tmux
```
For `Tmux`
## 🧐How this script works
1. This script first update and upgrade your system packages.
2. Next it downloads dependencies like `git`, `curl`, & `ripgrep` for `Neovim` installation.
3. Then it downloads and install `Neovim` as an `appimage` file (Because `Telescope` plugin in `Neovim` wants a latest version `>0.10.4`. But Debian package repos contain old version), move into `/opt/nvim/` directory and create a `symlink` on `/usr/local/bin/` directory. 
4. Because an `appimage` is a self-contained executable bundle. Usually third party applications put on `/opt` directory. So i followed the Linux Filesystem Hierarchy Standard (FHS). 
5. Also if `Neovim` releases a new version you manually keep multiple versions inside `/opt/nvim/` directory and switch between them by repointing the `symlink`. If you dump everything on `/usr/local/bin`, version management becomes messy.
6. Then it install `Tmux` using `APT` package manager.
7. After it install a plugin manager called `Plug` to manage `Neovim` plugins.
8. Next it configure `Neovim`, like `set linenumber`, `tabspace`, `enable mouse`, and automatically copied to system clipboard if you copy something on `Neovim`.
9. Then it install some plugins like `Airline` for pretty status bar, `Nerdtree` for file management, `Telescope` a famous fuzzy-finder, and some themes like `gruvobx`, `tokyonight`, `dracula`, etc.
10. Then it set some key bindings to simplify your workflow on `Neovim`, instead of type commands every time on `command mode`.
11. Then it configure `Tmux`, like set `r` key for reload our configuration if you edit that config file, change default prefix key from `Ctrl+b` to `Ctrl+space`, enable mouse, move the status bar to top of the screen, set `Neovim` like arrow keys `h,j,k,l`, and finally set base window number `1` instead of starting from `0`.
## Neo vim Key bindings
| Key binding    | Usage                                                                                                                                                                 |
| -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Ctrl+F`       | Focus on NERDTree window                                                                                                                                              |
| `Ctrl+n`       | Open NERDTree window                                                                                                                                                  |
| `Ctrl+t`       | Toggle (open/close) NERDTree window                                                                                                                                   |
| `Leaderkey+tt` | Split terminal horizontally                                                                                                                                           |
| `Leaderkey+tv` | Split terminal vertically                                                                                                                                             |
| `Ctrl+➡️`      | Go to next buffer                                                                                                                                                     |
| `Ctrl+⬅️`      | Go to previous buffer                                                                                                                                                 |
| `Leader+q`     | Close the current buffer                                                                                                                                              |
| `Leader+vs`    | Create a vertical scratch space for playing around AI generated code/compare two code bases, something like that but you can't save that buffer. It just for testing. |
| `Leader+ff`    | Telescope find files                                                                                                                                                  |
| `Leader+fg`    | Telescope live grep                                                                                                                                                   |
| `Leader+fb`    | Telescope buffers                                                                                                                                                     |
| `Leader+gc`    | Telescope git commits                                                                                                                                                 |
| `Leader+gs`    | Telescope git status                                                                                                                                                  |
| `Leader+ft`    | Telescope colorscheme. I add feature to preview the colorscheme when you move colorschemes.                                                                           |
| `Leader+fa`    | Telescope find files but you can find hidden directories and files                                                                                                    |
`Leaderkey` is `\`.
## Tmux Key bindings
| Key bindings  | Usage                    |
| ------------- | ------------------------ |
| `Leaderkey+r` | Reload `.tmux.conf` file |
| `Leaderkey+h` | Select left pane         |
| `Leaderkey+j` | Select below pane        |
| `Leaderkey+k` | Select top pane          |
| `Leaderkey+l` | Select right pane        |
`Leaderkey` is `Ctrl+Space`.
## 🤔How & Why I make this script
I saw some YouTube videos to setup the `Neovim` and `Tmux` manually in my `Lubuntu vm`. But I thought, **What if I want this setup in any new fresh installation of Ubuntu or Debian based distros**. Manually doing it takes lot of time. So simply automate it, is a very easy task to get our own custom development workspace in any machine.
I use these YouTube videos and also use Chat GPT for some help.
1. [Awesome Neovim Setup From Scratch-Full Guide](https://youtu.be/JWReY93Vl6g?si=pdwwO17zCplvVr-X) by `NeuralNine` to setup `Neovim`. But I only setup some basic and necessary setup not fully copy his setup.
2. [Making Tmux Better and Beautiful](https://youtu.be/jaI3Hcw-ZaA?si=bp0b5QkAjKvMC0do) by `typecraft` for `Tmux` setup. But again I only setup basic and necessary setup not fully copy his setup.
## Final Thoughts
If you have any errors or want some new features, ask in the GitHub issues place. I definitely do those changes and fix that bugs. Also I am beginner who starts his coding journey and contributing to community seems like dumb or silly. But I improve my skills everyday. This is very small introduction or starting point in my life. So support me, encourage me and thank you folks :)
