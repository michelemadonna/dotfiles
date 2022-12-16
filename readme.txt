Install Support Utilities
grc 
ripgrep
fd (on linux apt install fd-find)
exa
tree
nvim

git (#on mac you have to delete rm -Rf /usr/local/Cellar/git/*.*.*/share/zsh/site_functions/_git and
sudo ln -s /usr/share/zsh/x.x.x/functions/_git /usr/local/Cellar/git/*.*.*/share/zsh/site_functions/_git
sudo ln -s /usr/share/zsh/x.x.x/functions/_git /usr/local/share/zsh/site-functions/_git
for git completions)

gtop
duf
fzf (on mac is not needed)
delta (on mac git-delta)
bat (on linux make an ln -s /usr/bin/batcat /usr/bin/bat")
command-not-found(on mac brew tap homebrew/command-not-found on linux apt install command-not-found & apt update )

on mac ventura
sudo ln -s /Library/Developer/CommandLineTools/usr/bin/python3 /Library/Developer/CommandLineTools/usr/bin/python

Install SdkMan
curl -s "https://get.sdkman.io" | bash
source "/Users/michele/.sdkman/bin/sdkman-init.sh"

Add Forgit to path
export PATH="$PATH:$FORGIT_INSTALL_DIR/bin"


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

List of installed app
brew bundle dump
brew bundle install