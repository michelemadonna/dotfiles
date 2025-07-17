# ⚡️ Dotfiles for Zsh on macOS  and Ubuntu Linux 🐧

Welcome to my personal dotfiles repository! Here you'll find a comprehensive collection of Zsh configurations, optimized for both macOS and Ubuntu Linux.
The setup is based on [zsh-quickstart-kit](https://github.com/unixorn/zsh-quickstart-kit) and includes several terminal applications, each configured to maximize productivity, speed, and comfort for daily use.

## ⚡ How the Zsh Configuration Works

We do **not** use our own `.zshrc` file directly. Instead, we rely on the `.zshrc` provided by the `zsh-quickstart-kit`. **Do not modify this file**, as the framework includes an auto-update feature for itself and its plugins, ensuring you always get the latest fixes and improvements.

Here’s how it works:

- We use `stow` to create symlinks in our home directory, linking both the kit’s `.zshrc` and our custom configuration files from `$HOME/.dotfiles/zsh`.
- **Never edit the framework’s `.zshrc` directly.**  
  Instead, place your customizations in:
  - `$HOME/.dotfiles/zsh/zshrc.d/` for general configuration snippets.
  - `$HOME/.dotfiles/zsh/zshrc.pre-plugins` if you need to set environment variables or make changes before the kit loads plugins.
- The plugins loaded by Zsh are defined in `$HOME/.dotfiles/zsh/zsh/.zsh-quickstart-local-plugins`.

This setup keeps your customizations separate from the framework, making updates safe and easy.


---

## 1. 🧩 Components Used

- 🐚 **Zsh**: Main shell, powerful and highly customizable.
- ⚡️ **zgenom**: Lightweight and fast Zsh plugin manager.
- 🚀 **zsh-quickstart-kit**: Solid foundation for Zsh configuration.
- ✏️ **micro**: Modern terminal-based text editor (Of course, if you prefer a different editor, you can absolutely use it.).
- 🔀 **tmux**: Terminal multiplexer for managing multiple sessions.
- 📦 **asdf**: Version manager for programming languages.
- 🔍 **fzf**: Interactive fuzzy finder.
- 🦇 **bat**: Advanced file viewer with syntax highlighting.
- 🦸 **ripgrep**: Ultra-fast file search tool.
- 📁 **eza**: Modern replacement for `ls` with colors and icons.
- 🧠 **zsh-autosuggestions**: Automatic command suggestions as you type.
- 🎨 **zsh-syntax-highlighting**: Real-time syntax highlighting.
- 🛠️ **Other tools**: z, git, duf, wget, htop, and more.


This quickstart includes the [powerlevel10k](https://github.com/romkatv/powerlevel10k) ZSH theme, which requires a Powerline-compatible font in your terminal to display status glyphs. Powerline-compatible fonts include many useful glyphs, including the nice branch icon that the theme in this `.zshrc` uses.

In my configuration, I use [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) — a collection of over 20 patched fonts (over 1,700 variations) and the fontforge font patcher python script for Powerline, devicons, and vim-devicons. This includes fonts like Droid Sans, Meslo, AnonymousPro, ProFont, Inconsolata, and many more. These can be installed with Homebrew:  
```sh
brew install fontname
```
Replace `fontname` with the desired Nerd Font (for example, `font-fira-code-nerd-font` also in thr folder folder of this repo).

---

## 2. 🧰 About zgenom and zsh-quickstart-kit

### ⚡️ zgenom
zgenom is a plugin manager for Zsh that allows you to load themes and plugins in a modular and extremely fast way. It uses smart caching to reduce shell startup times and supports 
plugins from Oh-my-zsh and other sources.

### 🚀 zsh-quickstart-kit
zsh-quickstart-kit offers a thoughtfully organized set of Zsh configurations and plugins, aiming to deliver a reliable, secure, and flexible starting point for your shell environment. It brings together recommended practices, a curated plugin selection, and a clear structure to help you manage and extend your dotfiles with ease.

With zsh-quickstart-kit, your Zsh setup benefits from:

* Automated, regular updates for both `zgenom` and all enabled plugins.
* Shared command history across all open Zsh sessions, so you can access your recent commands from any terminal window.
* Automatic removal of duplicate entries in your command history.
* Enhanced tab completion, powered by the [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) project, with frequent updates for the latest completions.
* Powerful, interactive history search using [fzf](https://github.com/junegunn/fzf).
* Real-time syntax highlighting as you type commands.
* Tab completion for Rakefile tasks.
* Support for [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)-style plugins and themes, managed via [zgenom](https://github.com/jandamm/zgenom.git).
* Handy macOS-specific utilities for clipboard, audio, Spotlight, and Quicklook integration—these load only on macOS, so your configuration remains portable.
* Automatic loading of iTerm2 shell integration if it’s installed.

This kit is designed to work seamlessly on both macOS and Linux, making it easy to maintain a consistent and productive shell experience across platforms.

#### Included plugins

* [chrissicool/zsh-256color](https://github.com/chrissicool/zsh-256color) - Sets your terminal to 256 colors if available.
* [djui/alias-tips](https://github.com/djui/alias-tips) - Warns you when you have an alias for the command you just typed and tells you what it is.
* [eventi/noreallyjustfuckingstopalready](https://github.com/eventi/noreallyjustfuckingstopalready)- Deals with Apple's squirrelly DNS resolver. Only loads when you're running on macOS.
* [peterhurford/git-it-on.zsh](https://github.com/peterhurford/git-it-on.zsh) - Opens your current repository on GitHub, in your current branch.
* [robSis/zsh-completion-generator](https://github.com/RobSis/zsh-completion-generator) - Adds a tool to generate ZSH completion functions for programs missing them by parsing their `--help` output. Note that this doesn't happen dynamically; you'll have to explicitly run it to create a completion for each command missing one.
* [sharat87/pip-app](https://github.com/sharat87/pip-app) - A set of shell functions to make it easy to install small apps and utilities distributed with `pip`.
* [skx/sysadmin-util](https://github.com/skx/sysadmin-util) - A collection of scripts useful for sysadmins.
* [srijanshetty/docker-zsh](https://github.com/srijanshetty/docker-zsh) - Adds completions for `docker`.
* [stackexchange/blackbox](https://github.com/stackexchange/blackbox) - Tom Limoncelli's tool for storing secret information in a repository with GnuPG encryption, automatically decrypting as needed.
* [unixorn/1password-op.plugin.zsh](https://github.com/unixorn/1password-op.plugin.zsh) - Tab completions for [1Password](https://1password.com)'s [op](https://developer.1password.com/docs/cli/get-started/) command line tool. Only installs itself if `op` is in your `$PATH`.
* [unixorn/autoupdate-zgenom](https://github.com/unixorn/autoupdate-zgenom) - Adds autoupdate (for both `zgenom` itself, and your plugins) to `zgenom`.
* [unixorn/bitbucket-git-helpers](https://github.com/unixorn/bitbucket-git-helpers.plugin.zsh) - Adds `git` helper scripts for bitbucket.
* [unixorn/fzf-zsh-plugin](https://github.com/unixorn/fzf-zsh-plugin) - This enables `fzf`-powered history search.
* [unixorn/git-extra-commands](https://github.com/unixorn/git-extra-commands) - A collection of extra helper scripts for `git`.
* [unixorn/jpb.zshplugin](https://github.com/unixorn/jpb.zshplugin) - Some of my standard aliases & functions.
* [unixorn/tumult.plugin.zsh](https://github.com/unixorn/tumult.plugin.zsh) - Adds macOS-specific functions and scripts. This plugin only adds itself to your `$PATH` if you're running macOS to allow you to use the same plugin list on macOS and other systems.
* [zdharma-continuum/fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) - Syntax highlighting as you type.
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Adds fish-like autosuggestions to your ZSH sessions.
* [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) - Tab completions for many more applications than come standard with ZSH.
* [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) - Better history search.
* [Aloxaf/fzf-tab](https://github.com/Aloxaf/fzf-tab) - Replace zsh's default completion selection menu with fzf!.

The quickstart kit also uses `zgenom` to load oh-my-zsh and these plugins:

* aws
* brew - only loaded on macOS
* chruby
* colored-man
* git
* github
* osx - only loaded on macOS
* pip
* python
* rsync
* screen
* sudo
* vagrant


---

## 3. 🍏 Installation on macOS
> **Note:** Zsh is the default shell on macOS starting from version 10.15 (Catalina). If you are using an earlier version, you may need to install Zsh manually.

### Prerequisites
- Homebrew  
> Install Homebrew (if not already installed) with:
>   ```sh
>   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
>   ```

- iTerm2
> Install iTerm2 with:
>   ```sh
>    brew install iterm2
>   ```

- A Powerline-compatible font
> Install Fira Code Nerd Font with:
>   ```sh
>   brew install font-fira-code-nerd-font
>   ```

Open iTerm2’s default profile settings, set the font to `FiraCode Nerd Font` → `Retina`, and make sure the Use Ligatures option is enabled.
You can use your favorite color scheme — or simply import my iTerm2 configuration from the `iterm2` folder in this repository.

In my setup, I use a slightly customized version of the **Astronaut** colorscheme. Another colorscheme I really like is **Breeze**.

### Installation

1. **Fork this repo and clone the repository on your local home dir:**
    ```sh
    git clone https://github.com/your-username/dotfiles.git ~/.dotfiles

    ```

2. **Install essential packages:**
    ```sh
    brew tap "homebrew/command-not-found"
    brew install coreutils
    brew install bat
    brew install eza 
    brew install fd
    brew install git-delta
    brew install htop
    brew install ripgrep
    brew install stow
    brew install tmux
    brew install tree
    brew install wget
    brew install git
    brew install micro
    ```

3. **Link dotfiles using stow:**
    ```sh
    git clone https://github.com/jandamm/zgenom.git .zgenom 
    git clone https://github.com/unixorn/zsh-quickstart-kit.git .zqs 
    cd $HOME/.zqs && stow --target=$HOME zsh && cd  
    cd $HOME/.dotfiles/zsh && stow --target=$HOME zsh && cd  
    cd $HOME/.dotfiles/zsh && stow --target=$HOME/.zshrc.d zshrc.d
    mkdir -p "$HOME/.ssh" && cd "$HOME/.dotfiles" && stow --target="$HOME/.ssh" ssh && cd
    ```

4. **Fix Zsh Git Autocompletion on macOS Homebrew Installs**

> **Note:** Installing Git via Homebrew can break Zsh autocompletion for Git. To restore proper autocompletion, run the following commands (replace `2.49.0` with your installed Git version if different):

```sh
rm -Rf /usr/local/Cellar/git/2.49.0/share/zsh/site-functions/_git
sudo ln -s /usr/share/zsh/5.9/functions/_git /usr/local/Cellar/git/2.49.0/share/zsh/site-functions/_git
```

This will symlink the system-provided `_git` completion script, restoring full Git autocompletion in Zsh.

5. **Customize Powerlevel10k Prompt**

If you want to change the appearance or behavior of your Powerlevel10k prompt, simply run:

```sh
p10k configure
```

This will launch an interactive configuration wizard to help you personalize your prompt.

6. **Restart your terminal.**

---

## 4. 🐧 Installation on Linux (Ubuntu)

1. **Clone the repository:**
    ```sh
    git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ```
2. **Install required packages:**
    ```sh
    sudo apt update
    sudo apt install zsh tmux micro git curl fzf bat ripgrep exa wget htop
    ```
3. **Link dotfiles using the script:**
    ```sh
    ./install.sh
    ```
4. **Set Zsh as the default shell:**
    ```sh
    chsh -s $(which zsh)
    ```
5. **Restart your terminal.**

---

## 5. 🛠️ Optional Components & Configuration

### ✏️ **Micro**
[**Micro**](https://micro-editor.github.io) is a modern, easy-to-use terminal-based text editor with a clean UI, mouse support, and powerful plugin system.  
Configuration is managed via `~/.config/micro/settings.json`. Micro includes built-in plugins for syntax highlighting, linting, and more.

You can easily manage plugins directly from within Micro:

- To list installed plugins:  
    <kbd>Ctrl</kbd> + <kbd>E</kbd> then type `plugin list`
- To see available plugins:  
    <kbd>Ctrl</kbd> + <kbd>E</kbd> then type `plugin available`
- To install a plugin:  
    <kbd>Ctrl</kbd> + <kbd>E</kbd> then type `plugin install <plugin-name>`
- To remove a plugin:  
    <kbd>Ctrl</kbd> + <kbd>E</kbd> then type `plugin remove <plugin-name>`

some useful plugins are :
- [filemanager](https://github.com/NicolaiSoeborg/filemanager-plugin) — Tree-based file explorer 
- [fzf](https://github.com/samdmarshall/micro-fzf-plugin) — Fuzzy file finder


**Example workflow:**

1. Press <kbd>Ctrl</kbd> + <kbd>E</kbd> to open the command bar.
2. Type `open myfile.txt` to open a file.
3. Press <kbd>Ctrl</kbd> + <kbd>E</kbd> and type `hsplit` to create a horizontal split.
4. In the new split (bottom pane), press <kbd>Ctrl</kbd> + <kbd>E</kbd> and type `term` to open a terminal.

This allows you to edit files and run terminal commands side by side within Micro.

### 📦 **asdf**
[**asdf**](https://asdf-vm.com) **universal runtime version manager** is a single CLI tool to install, switch, and manage different versions of programming 
languages and other tools per project or globally. It unifies workflows traditionally handled by tools like nvm, rbenv, pyenv, and gvm, 
offering a clean, consistent interface and a powerful plugin ecosystem.

- Single config file (.tool-versions) tracks all tool/runtime versions for your project and can be checked into version control
- Automatic version switching: as you navigate across project directories, asdf auto-activates the right tool versions defined in .tool-versions
- Modular plugins power support not only for major languages (Node.js, Python, Java, Ruby, etc.), but also for tools like Terraform, kubectl, PostgreSQL, Redis and more
- Shell completions for Bash, Zsh, Fish & Elvish make installing and specifying versions easy with tab-completion

**Installation**
    
    # Install asdf (macOS example)
    brew install asdf
    # Install the "system" version use as default using the latest LTS version
    brew install oracle-jdk@21
    brew install node@22

    # Or on Linux (with git & zsh)
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
    
    #reload term session
    

**Plugins installation**
    
    asdf plugin add java
    asdf plugin add nodejs
    asdf plugin add python
    

**Installing & Using Tools**
    
    #install one specific tool. Using Tab a list of installable version appers
    asdf install java oracle-17 or asdf install java [TAB]

    # List installed versions
    asdf list java

    # Verify what's currently used
    asdf current

    # Verify what java version is currently used
    asdf current java

    # Set per-user versions
    asdf set -u java system # or asdf set -u java [TAB] to use completition

    # Set per-project versions (in the project's root folder)
    asdf set java oracle-17 # or asdf set -u java [TAB] to use completition
    

    > **Note:**  
    > In this example, if you do **not** specify a Java version within a project (i.e., there is no `.tool-versions` file in the project directory), asdf will use the system-wide Java version by default.  
    > However, if you define a specific Java version for a project (by running `asdf set java <version>` in the project folder), asdf will automatically switch to that version whenever you enter the directory or open the project in an editor like VSCode or IntelliJ. This ensures your project always uses the correct Java version without manual intervention.

    > **Alert:**  
    > In some cases, to view all installed versions of a tool managed by asdf, you may need to install at least one additional version of that tool. This ensures asdf can properly list and manage multiple versions on your system.

- 🔀 **tmux**: Advanced configuration in `~/.tmux.conf` with persistent sessions, plugin manager (tpm), custom status bar, and optimized keybindings.
- 📦 **asdf**: Manages versions of Node.js, Python, Ruby, Elixir, Go, etc. Configuration in `~/.tool-versions`. Add plugins with `asdf plugin-add <language>`.
- 🔍 **fzf**: Fuzzy search in history, files, and commands. Integrated with Zsh for fast completions.
- 🦇 **bat**: File viewer with syntax highlighting and line numbers.
- 🦸 **ripgrep**: Recursive file search, much faster than `grep`.
- 📁 **exa**: Directory listing with colors, icons, and detailed info.
- 🧠 **zsh-autosuggestions**: Automatic command suggestions as you type.
- 🎨 **zsh-syntax-highlighting**: Real-time syntax highlighting.
- 🗂️ **z**: Fast navigation between frequently used directories.

To enable/disable components, edit the corresponding configuration files in your dotfiles (`.zshrc`, `.tmux.conf`, etc.).

---

## 6. ⌨️ Keybindings

### 🐚 Zsh
- `Ctrl + R` — Search history (fzf).
- `Double Esc` — Insert sudo before last command.
- `Ctrl + T` — Fuzzy file path completion (fzf).
- `Alt + C` / `Esc + C` — Cd into a selected subdirectory (fzf).
- `Tab` — Open Autocomplete with fzf menu (fzf-tab).

### 🔍 fzf
- `↑ / ↓` — Move up/down
- `Tab` — Cycle selection                                           
- `Ctrl + Space` — Mark/unmark 
- `Ctrl + A` — Toggle Mark/unmark                                            
- `Enter` — Select the current item(s)                             
- `Ctrl + C` — Cancel                                                 
- `Ctrl + U` — Clear query (delete upward)                            
- `Ctrl + D` — Delete downward                                        
- `Ctrl + R` — (If using shell integration) fuzzy history search      
- `Ctrl + T` — Insert file path into command line (shell integration as `micro` `Ctrl-T`) 
- `Alt + J / K` — Move preview down/up/ (if preview enabled)              
- `Alt + P` — Toggles the preview.
- `, .` —  Switch group (fzf-tab)

### 🔀 tmux
- `Ctrl + A` — Prefix (instead of `Ctrl + B`).
- `Ctrl + A c` — New window.
- `Ctrl + A "` — Horizontal split.
- `Ctrl + A %` — Vertical split.
- `Ctrl + A [` — Copy mode.
- `Ctrl + A d` — Detach session.
- `Ctrl + A + ↑ / ↓ / ← / →` Move between panes

### ✏️ micro
**Navigation**
- `↑ / ↓ / ← / →` — Move cursor in the corresponding direction
- `Shift + ↑ / ↓ / ← / →` — Select up/down/left/right
- `Alt + ←` — Start of text toggle
- `Alt + →` — End of line
- `Home` — Start of text
- `End` — End of line
- `PageUp / PageDown` — Cursor page up/down
**Editing**
- `Backspace` — Delete character left
- `Alt + Backspace` — Delete word left
- `Tab` — Autocomplete / Indent selection / Insert tab
- `Delete` — Delete character right
- `Ctrl + D` — Duplicate / Duplicate line
- `Ctrl + K` — Cut line
- `Ctrl + X` — Cut / Cut line
- `Ctrl + C` — Copy / Copy line
- `Ctrl + V` — Paste
- `Ctrl + A` — Select all
**File Operations**
- `Ctrl + O` — Open file
- `Ctrl + S` — Save
- `F2` — Save
- `Ctrl + Q` — Quit
- `F4 / F10` — Quit
**Search**
- `Ctrl + F` — Find
- `F3 / F7` — Find
- `Ctrl + N` — Find next
- `Ctrl + P` — Find previous
**Undo / Redo**
- `Ctrl + Z` — Undo
- `Ctrl + Y` — Redo
**UI Toggles**
- `Ctrl + G` — Toggle help
- `Alt + G` — Toggle key menu
- `Ctrl + R` — Toggle ruler
- `Ctrl + L` — Command-edit (goto)
- `Ctrl + E` — Command bar
**Tabs & Splits**
- `Ctrl + T` — Add tab
- `Alt + , / Ctrl + PageUp` — Previous tab / Last tab
- `Alt + . / Ctrl + PageDown` — Next tab / First tab
- `Ctrl + W` — Next split / First split
**Macro**
- `Ctrl + U` — Toggle macro recording
- `Ctrl + J` — Play macro
**Multi Cursor**
- `Alt + ↑ / ↓` — Move line up/down
- `Alt + Shift + ↑ / ↓` — Spawn multi-cursor up/down
- `Alt + N` — Spawn multi-cursor
- `Alt + P` — Remove multi-cursor
- `Alt + C` — Remove all multi-cursors
**Mouse**
- `Mouse Wheel Up/Down` — Scroll
- `Mouse Left` — Select text / split
- `Mouse Left Drag` — Resize split / select
- `Mouse Middle` — Paste primary
- `Ctrl + Mouse Left` — Multi-cursor (in iterm2 -> Settings -> Pointer -> check ^-Click reported to apps, does not open menu)

Check the configuration files for more details and customizations.

---

## 📚 Tips & Customization

- Add your favorite Zsh plugins by editing `.zshrc` or the zgenom plugin section.
- Customize prompt, colors, and aliases as you like.
- Update tools with `brew upgrade` (macOS) or `sudo apt upgrade` (Linux).
- Sync your dotfiles across multiple machines using Git.

---

> **Note:** Replace `your-username` with your actual GitHub username and adjust paths as needed. For questions or suggestions, open an issue or pull request!


## Functions and Aliases

#### Customizing with ~/.zshrc.d

The `.zshrc` included in this kit will automatically source any files it finds in `~/.zshrc.d`. This happens after plugins are loaded. If you need to set variables or aliases before plugins are loaded, create files in `~/.zshrc.pre-plugins.d`.

This makes it easy for you to add extra functions and aliases without having to maintain a separate fork of this repository and allows you to configure the behavior of some of the plugins by setting environment variables.

The files will be sourced in alphanumeric order after loading all the plugins, and I suggest you use a naming scheme of `001-onething`, `002-something-else` etc., to ensure they're loaded in the order you expect.

### I like a plugin, but some of the aliases and functions it installs overwrite other commands or aliases I use

Make a file in `~/.zshrc.d` named something like `999-reset-aliases`. Because files in `~/.zshrc.d` are loaded after all the ZSH plugins, you can add lines like `unalias xyzzy` to remove an alias named `xyzzy`, or `unset -f abcd` to remove a function named `abcd`.

Once you've cleared all the unwanted aliases and functions, you can add new ones with your preferred names.

### ZSH options

The quickstart kit does an opinionated (i.e., my way) setup of ZSH options and adds some functions and aliases I like on my systems. I don't want you to have to maintain a separate fork if you don't like them and/or want to add your own, so the kit allows you to override or add behavior by creating fragment files that it will load during session startup.

#### Fragment file directories

You can customize the quickstart by adding files to its various `zshrc.d` directories.

If you want to set variables _before_ the quickstart starts loading plugins to alter their behavior, stick your fragment files in `~/.zshrc.pre-plugins.d`.

After the quickstart sets up its aliases, functions, plugins and ZSH options, it will source every fragment file in `~/.zshrc.d`.

To make it easier to have macOS, FreeBSD or Linux-specific settings tweaks, the quickstart also supports OS-specific pre & post `.zshrc.d` directories. If you want a file to only be sourced on a single OS, the quickstart also checks for `.zshrc.pre-plugins.$(uname).d` and `~/.zshrc.$(uname).d` during loading.

For your convenience, the quickstart will also look for a `.zshrc.work.d` directory, and if it's present, load fragment files from there. This lets you have a separate directory in your dotfiles repository for work-specific customizations.

### Self-update Settings

The quickstart kit will automatically check for updates every seven days. If you want to change the interval, set `QUICKSTART_KIT_REFRESH_IN_DAYS` in a file in `~/.zshrc.d`. If you're going to disable self-updating entirely, add `unset QUICKSTART_KIT_REFRESH_IN_DAYS` in a file in `~/.zshrc.d`.

### Customizing the plugin list

I've included what I think is a good starter set of ZSH plugins in this repository. However, everyone has their preferences for their environment.

To make things easier to customize without users having to maintain their own forks, the kit provides two ways to customize the list of plugins it will load.

You can either add a fragment file to `~/.zshrc.add-plugins.d`, or you can make a `~/.zsh-quickstart-local-plugin` file.

#### Using fragment files

If all you want to do is add plugins to the standard list and you want to still automatically get any new changes I make to that standard list (new plugins, new locations when existing plugins are moved, etc) then adding a file into `~/.zshrc.add-plugins.d` with your extra plugins listed as `zgenom load githubuser/pluginrepo` (one line per plugin) is the way to go. The kit will load its plugins, then add yours on the end. You can add separate files with plugins in the `~/.zshrc.add-plugins.d` directory - my personal use case is having one file with all the plugins I use everywhere, and one that has extra plugins I only need on my work machines. This is the easiest option.

#### Complete plugin list replacement

If you don't care about future changes to the kit's plugins and want to fully replace the built-in list, then create a `~/.zsh-quickstart-local-plugins` file. When the kit detects a file named `~/.zsh-quickstart-local-plugins`, its `.zshrc` will source that **instead** of running the `load-starter-plugin-list` function defined in `~/.zgen-setup`.

**Using `~/.zsh-quickstart-local-plugins` is not additive. It will *completely replace* the kit-provided list of plugins.** If you want to just add more plugins, use the fragment file method above.

Creating a `.zsh-quickstart-local-plugins` from scratch is a pain, so to make customizing your plugin list easier, I've included a `.zsh-quickstart-local-plugins-example` file at the root of the repository that installs the same plugin list that the kit does by default that you can use as a starting point for your own `.zsh-quickstart-local-plugins` file.

Copy that to your `$HOME/.zsh-quickstart-local-plugins`, change the list, and the next time you start a terminal session, you'll get your plugin list loaded instead of the kit's defaults.

