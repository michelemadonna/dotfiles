#Install Support Utilities

on debian
----------
apt update
apt install -y zsh grc ripgrep fd-find exa tree neovim git python3 python3-pip duf fzf bat command-not-found neofetch git-delta stow curl gawk dirmngr gpg unzip jq tmux mc tldr gping hexyl htop
apt update

if gping is not found
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ stable main" | sudo tee /etc/apt/sources.list.d/azlux.list
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
sudo apt update
sudo apt install gping

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
ln -s /usr/bin/batcat /usr/bin/bat
chsh -s /bin/zsh

on macos
----------
brew tap "homebrew/command-not-found"
brew "coreutils"
brew "asdf" (***)
brew "bat"
brew "dog"
brew "duf"
brew "exa"
brew "fd"
brew "git-delta"
brew "gping"
brew "grc"
brew "gtop"
brew "hexyl"
brew "htop"
brew "httpie"
brew "midnight-commander"
brew "neofetch"
brew "neovim"
brew "nmap"
brew "procs"
brew "python@3.10" (*)
brew "ripgrep"
brew "stow"
brew "tldr"
brew "tmux"
brew "tree"
brew "wget"
brew "git" (**)

(*) on mac ventura
sudo ln -s /Library/Developer/CommandLineTools/usr/bin/python3 /Library/Developer/CommandLineTools/usr/bin/python
(**) git (#on mac you have to delete rm -Rf /usr/local/Cellar/git/*.*.*/share/zsh/site_functions/_git and
sudo ln -s /usr/share/zsh/x.x.x/functions/_git /usr/local/Cellar/git/*.*.*/share/zsh/site_functions/_git
sudo ln -s /usr/share/zsh/x.x.x/functions/_git /usr/local/share/zsh/site-functions/_git
for git completions)
(***) modify $HOME/.asdf/plugins/java/set-java-home.zsh
to enable use asdf with the macos system JDK
if [[ "$java_path" == "/usr/bin/java" ]]; then
      JAVA_HOME="$(/usr/libexec/java_home)"
    else
      JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
fi


link all configs
-----------------
git clone https://github.com/jandamm/zgenom.git .zgenom 
git clone https://github.com/unixorn/zsh-quickstart-kit.git .zqs 
git clone https://github.com/michelemadonna/dotfiles.git .dotfiles 
cd $HOME/.zqs && stow --target=$HOME zsh && cd $HOME/.dotfiles/zsh && stow --target=$HOME zsh && cd $HOME/.dotfiles/nvim/.config && stow --target=$HOME/.config nvim


Install asdf plugin
----------------------
asdf plugin add java
asdf plugin add maven
asdf plugin add nodejs


List of installed app on mac
----------------------------
brew leaves --installed-on-request | xargs brew desc --eval-all
brew ls --casks | xargs brew desc --eval-all
mas list

brew bundle dump
brew bundle install