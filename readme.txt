#Install Support Utilities

on debian
----------
apt update
apt install -y zsh grc ripgrep fd-find eza tree micro git python3 python3-pip duf fzf bat command-not-found neofetch git-delta stow curl gawk dirmngr gpg unzip jq tmux mc tldr gping hexyl htop
apt update

if gping is not found
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ stable main" | sudo tee /etc/apt/sources.list.d/azlux.list
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
sudo apt update
sudo apt install gping

Install asdf
Visit https://github.com/asdf-vm/asdf/releases and download the appropriate archive for your operating system/architecture combination.
Extract the asdf binary in the archive in ~/.asdf
Verify asdf is on your shell's $PATH by running type -a asdf. The directory you placed the asdf binary in should be listed on the first line of the output from type. If it is not that means step #2 was not completed correctly.

ln -s /usr/bin/batcat /usr/bin/bat
chsh -s /bin/zsh

#add fzf completition i zsh for ubuntu
ln /usr/share/doc/fzf/examples/completion.zsh $HOME/.fzf/shell/completion.zsh
ln /usr/share/doc/fzf/examples/key-bindigs.zsh $HOME/.fzf/shell/key-bindings.zsh
  

on macos
----------
brew tap "homebrew/command-not-found"
brew "coreutils"
brew "asdf" (***)
brew "bat"
brew "dog"
brew "duf"
brew "eza" 
brew "fd"
brew "git-delta"
brew "gping"
brew "grc"
brew "gtop"
brew "hexyl"
brew "htop"
brew "httpie"
brew "midnight-commander"
brew "fastfetch"
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
brew "micro"
brew "dust"

(*) on mac ventura
sudo ln -s /Library/Developer/CommandLineTools/usr/bin/python3 /Library/Developer/CommandLineTools/usr/bin/python
(**) git (#on mac you have to delete rm -Rf /usr/local/Cellar/git/*.*.*/share/zsh/site_functions/_git and
sudo ln -s /usr/share/zsh/x.x.x/functions/_git /usr/local/Cellar/git/*.*.*/share/zsh/site_functions/_git
sudo ln -s /usr/share/zsh/x.x.x/functions/_git /usr/local/share/zsh/site-functions/_git
for git completions)
(***) modify $HOME/.asdf/plugins/java/set-java-home.zsh
to enable use asdf with the macos system JDK
asdf_update_java_home() {
  local java_path
  java_path="$(asdf which java)"
  if [[ -n "${java_path}" ]]; then
    export JAVA_HOME
    if [[ "$java_path" == "/usr/bin/java" ]]; then
    	JAVA_HOME="$(/usr/libexec/java_home)"
    else	
    	JAVA_HOME="$(dirname "$(dirname "${java_path:A}")")"
	fi
	export JAVA_HOME=${JAVA_HOME}
    export JDK_HOME=${JAVA_HOME}
  fi
}
autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_java_home
(no more needed) and for maven for using system jdk comment out ~/.asdf/plugins/maven/bin/exec-env 


link all configs
-----------------
git clone https://github.com/jandamm/zgenom.git .zgenom 
git clone https://github.com/unixorn/zsh-quickstart-kit.git .zqs 
git clone https://github.com/michelemadonna/dotfiles.git .dotfiles 
cd $HOME/.zqs && stow --target=$HOME zsh 
cd $HOME/.dotfiles/zsh && stow --target=$HOME zsh 
cd $HOME/.dotfiles/zsh && stow --target=$HOME/.zshrc.d zshrc.d
cd $HOME/.dotfiles/nvim/.config && stow --target=$HOME/.config nvim


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
