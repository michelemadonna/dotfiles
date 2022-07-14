grc 
ripgrep
fd (on linux apt install fd-find)
exa
tree
nvim
git (#on mac you have to delete rm -Rf /usr/local/Cellar/git/*.*.*/share/zsh/site_functions/_git and ln -s /usr/share/zsh/5.8/functions/_git . for git completions)
gtop
duf
fzf (on mac is not needed)
delta
bat (on linux make an ln -s /usr/bin/batcat /usr/bin/bat")
command-not-found(on mac brew tap homebrew/command-not-found on linux apt install command-not-found & apt update )

Install Zgenom
cd ~
git clone https://github.com/jandamm/zgenom.git

Install the starter kit
cd ~
git clone https://github.com/unixorn/zsh-quickstart-kit.git
Configure zsh by symlinking the .zshrc, .zsh-functions, .zgen-setup and .zsh_aliases from this repository into your ~.
You can do this with stow by:
cd zsh-quickstart-kit
stow --target=~ zsh. If you have issues using ~ as a target, do stow --target="$HOME" zsh. If you still have errors, symlink the files in the kit's zsh directory into your home directory.

  [✔] $HOME/.gitattributes → /root/.dotfiles/git/gitattributes
  [✔] $HOME/.main.gitconfig → /root/.dotfiles/git/main.gitconfig
  [✔] $HOME/.gitignore → /root/.dotfiles/git/gitignore
  [✔] $HOME/.ignore → /root/.dotfiles/shell/ignore
  [✔] $HOME/.ripgreprc → /root/.dotfiles/shell/ripgreprc
  [✔] $HOME/.tmux.conf → /root/.dotfiles/shell/tmux.conf
  [✔] $HOME/.vimrc → /root/.dotfiles/shell/vimrc
  [✔] $HOME/.zshrc → /root/.dotfiles/shell/zshrc
  [✔] $HOME/.p10k.zsh → /root/.dotfiles/shell/p10k.zsh
  [✔] $HOME/.config/nvim → /root/.dotfiles/nvim
