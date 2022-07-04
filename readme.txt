grc
fd (on linux apt install fd-find)
exa
tree
nvim
git
gtop
duf
fzf
delta
bat (on linux make an ln -s /usr/bin/batcat /usr/bin/bat")
command-not-found(only on linux apt install command-not-found & apt update )

ZSH Quickstart Kit

OS-specific setup

fzf

To enable the enhanced history search, you'll need to install fzf. Manual install instructions can be found at fzf and os-specific instructions below.

macOS

Download iTerm2 from http://www.iterm2.com (optional). In my opinion, it is considerably nicer than the stock Terminal application that comes with macOS. There is an RCE flaw in all versions of iTerm 2 before 3.3.6, so update if you're using an affected version.
Install the current version of Homebrew from http://brew.sh/.
Install GNU Stow with brew install stow
Homebrew has a newer version of zsh than the one Apple shipped with the OS before 11.6, so brew install zsh to install it.
Switch your shell to zsh if necessary - Apple has defaulted the shell for new users to zsh since macOS Catalina (10.15):
System Preferences -> Users & Groups.
Unlock the preferences
Select your user
Select advanced options
Set your login shell to /bin/zsh (or /usr/local/bin/zsh if you decided to use the version packaged by brew)
Install some Powerline-compatible or NerdFont fonts from one of the links in the Fonts section above.
In iTerm 2, go to Preferences->Profile in your iTerm 2 preferences, then select one of the Powerline-compatible fonts you just installed.
Make sure you also specify a Powerline-compatible font for non-ASCII in your iTerm 2 preferences or the prompt separators and branch glyphs will show up garbled.
Install fzf with brew install fzf
Linux

Switch your shell to zsh with chsh -s /bin/zsh
Install GNU Stow - sudo yum install -y stow on Red Hat / CentOS systems, sudo apt-get -y install stow on Debian / Ubuntu.
Install fzf - sudo apt-get install -y fzf on Debian / Ubuntu, do a manual install on Red Hat / Centos - instructions are at fzf.
Install the patched font in a valid X font path. Valid font paths can be listed with xset q: mv YourChosenPowerlineFont.otf ~/.fonts
Update the font cache for the path the font was installed in (root privileges may be needed for updating the font cache for some paths): fc-cache -vf ~/.fonts/
After installing a Nerdfont or Powerline-compatible font, you will need to configure your terminal emulator to use your selected Powerline-compatible font. The name of the correct font usually ends with for Powerline.

If the Powerline symbols can't be seen or are garbled, try closing all instances of the terminal emulator. The X Server may also need to be restarted for the new font to load correctly.

If you still can’t see the new fonts, confirm that the font has been installed to a valid X font path.

If you get garbled branch glyphs, make sure there isn't a separate font setting for non-ASCII characters in your terminal application that you also need to set to use a Powerline-compatible font. Konsole needs to be set to use UTF-8 encoding, for example.

Set up Zgenom and the starter kit

Now that your fonts and default shell have been set up, install zgenom and the dotfiles from this starter kit repository.

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