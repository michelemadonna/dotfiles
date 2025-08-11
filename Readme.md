# ⚡️ Dotfiles for Zsh on macOS  and Ubuntu Linux 🐧

Welcome to my personal dotfiles repository! Here you'll find a comprehensive collection of Zsh configurations, optimized for both macOS and Ubuntu Linux (LTS).
The setup is based on [zsh-quickstart-kit](https://github.com/unixorn/zsh-quickstart-kit) and includes several terminal applications, each configured to maximize productivity, speed, and comfort for daily use.

## ⚡ How the Zsh Configuration Works

The `.zshrc` file from the `zsh-quickstart-kit` is used as the main configuration entry point, rather than maintaining a separate `.zshrc`. **Direct modifications to this file are discouraged**, as the framework manages its own updates and those of its plugins to ensure the latest improvements are always applied.

Configuration is managed as follows:

- `stow` is used to create symlinks in the home directory, linking both the kit’s `.zshrc` and any custom configuration files from `$HOME/.dotfiles/zsh`.
- **Avoid editing the framework’s `.zshrc` directly.**  
    Instead, place customizations in:
    - `$HOME/.dotfiles/zsh/zshrc.d/` for general configuration snippets.
    - `$HOME/.dotfiles/zsh/zshrc.pre-plugins` for environment variables or changes that must be applied before plugins are loaded.
- The list of plugins loaded by Zsh is defined in `$HOME/.dotfiles/zsh/zsh/.zsh-quickstart-local-plugins`.

This approach keeps custom settings separate from the framework, making updates straightforward and safe.

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

In my configuration, I use [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) — a collection of over 20 patched fonts (over 1,700 variations). This includes fonts like Droid Sans, Meslo, AnonymousPro, ProFont, Inconsolata, and many more. These can be installed with Homebrew:  

```sh
brew install fontname
```
Replace `fontname` with the desired Nerd Font (for example, `font-fira-code-nerd-font` also in thr folder folder of this repo).

---

## 2. 🧰 About zgenom and zsh-quickstart-kit

### ⚡️ zgenom
zgenom is a plugin manager for Zsh that allows you to load themes and plugins in a modular and extremely fast way. It uses smart caching to reduce shell startup times and supports plugins from Oh-my-zsh and other sources.

### 🚀 zsh-quickstart-kit
zsh-quickstart-kit offers a thoughtfully organized set of Zsh configurations and plugins, aiming to deliver a reliable, secure, and flexible starting point for your shell environment. It brings together recommended practices, a curated plugin selection, and a clear structure to help you manage and extend your dotfiles with ease.

With zsh-quickstart-kit, your Zsh setup benefits from:

* Automated, regular updates for both `zgenom` and all enabled plugins.
* Shared command history across all open Zsh sessions, so you can access your recent commands from any terminal window.
* Automatic removal of duplicate entries in your command history.
* Enhanced tab completion, powered by the [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) project, with frequent updates for the latest completions.
* Powerful, interactive history search using [fzf](https://github.com/junegunn/fzf).
* Real-time syntax highlighting as you type commands.
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
* [unixorn/fzf-zsh-plugin](https://github.com/unixorn/fzf-zsh-plugin) - This enables `fzf`-powered history search.
* [unixorn/git-extra-commands](https://github.com/unixorn/git-extra-commands) - A collection of extra helper scripts for `git`.
* [unixorn/jpb.zshplugin](https://github.com/unixorn/jpb.zshplugin) - Some useful standard aliases & functions.
* [unixorn/tumult.plugin.zsh](https://github.com/unixorn/tumult.plugin.zsh) - Adds macOS-specific functions and scripts. This plugin only adds itself to your `$PATH` if you're running macOS to allow you to use the same plugin list on macOS and other systems.
* [zdharma-continuum/fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) - Syntax highlighting as you type.
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - Adds fish-like autosuggestions to your ZSH sessions.
* [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) - Tab completions for many more applications than come standard with ZSH.
* [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) - Better history search.
* [Aloxaf/fzf-tab](https://github.com/Aloxaf/fzf-tab) - Replace zsh's default completion selection menu with fzf!.

The quickstart kit also uses `zgenom` to load oh-my-zsh and these plugins:

* aws
* brew - only loaded on macOS
* colored-man
* git
* github
* osx - only loaded on macOS
* pip
* python
* rsync
* screen
* sudo
* asdf
* kubectl

---

## 3. 🍏 Installation on macOS
> **Note:** Zsh is the default shell on macOS starting from version 10.15 (Catalina). If you are using an earlier version, you may need to install Zsh manually.

### Prerequisites
- Fork this repo on GitHub

- Homebrew  
> Install Homebrew (if not already installed) with:
>   ```sh
>   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
>   ```

- Git
> Install Git with:
>   ```sh
>   brew install git
>

- Clone **your forked** repository on your local home dir with:
>    ```sh
>    git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
>
>    ```

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

In my setup, I use a slightly customized version of the **Argonaut** colorscheme called **Astronaut**. Another colorscheme I really like is **Breeze**.

> 💡 **Recommended Alternative: [Ghostty](https://github.com/ghostty-org/ghostty)**
>
> Consider trying [Ghostty](https://github.com/ghostty-org/ghostty), a modern, lightweight, and cross-platform open source terminal emulator.
>
> **Advantages of Ghostty:**
> - High performance with minimal resource usage.
> - Native GPU rendering and advanced Unicode support.
> - Extensive customization for fonts, colors, and layouts.
> - **With the `@tip` version, you can enable *shaders* for advanced graphical effects and animations directly in your terminal!**
>
> This repository includes my personal Ghostty configuration, which by default applies the same custom theme I use on iTerm2.
> Give it a try for an even more modern and "fancy" terminal experience!

- Ghostty(@tip)
> Install Ghostty with:
>   ```sh
>   brew install ghostty@tip
>   ```
>Create a symbolic link to the Ghostty configuration for using this repo configuration:
>```sh
>   ln -s $HOME/.dotfiles/ghostty $HOME/.config/
>```
>Restart Ghostty for the changes to take effect.

### Installation

1. **Install essential packages:**
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

2. **Link dotfiles using stow:**
    ```sh
    git clone https://github.com/jandamm/zgenom.git .zgenom 
    git clone https://github.com/unixorn/zsh-quickstart-kit.git .zqs 
    cd $HOME/.zqs && stow --target=$HOME zsh && cd  
    cd $HOME/.dotfiles/zsh && stow --target=$HOME zsh && cd  
    cd $HOME/.dotfiles/zsh && stow --target=$HOME/.zshrc.d zshrc.d && cd
    ```

3. **Fix Zsh Git Autocompletion on macOS Homebrew Installs**

> **Note:** Installing Git via Homebrew can break Zsh autocompletion for Git. To restore proper autocompletion, run the following commands (replace `2.49.0` with your installed Git version if different):

```sh
rm -Rf /usr/local/Cellar/git/2.49.0/share/zsh/site-functions/_git
sudo ln -s /usr/share/zsh/5.9/functions/_git /usr/local/Cellar/git/2.49.0/share/zsh/site-functions/_git
```

This will symlink the system-provided `_git` completion script, restoring full Git autocompletion in Zsh.

4. **Customize Powerlevel10k Prompt**

If you want to change the appearance or behavior of your Powerlevel10k prompt, simply run:

```sh
p10k configure
```

This will launch an interactive configuration wizard to help you personalize your prompt.

5. **Restart your terminal.**

---

## 4. 🐧 Installation on Linux (Ubuntu)

### Prerequisites
- Fork this repo on GitHub ```

- Git
> Install Git with:
>   ```sh
>   sudo apt update
>   sudo apt install git
>   ```

- Zsh
> Install Zsh with:
>   ```sh
>   sudo apt update
>   sudo apt install zsh
>   chsh -s /bin/zsh
>   ```
>   Log out and log back in for the changes to take effect.

- Clone **your forked** repository on your local home dir with:
>    ```sh
>    git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
>
>    ```  ```

- A Powerline-compatible font
> Install Fira Code Nerd Font with:
>   ```sh
>    mkdir -p $HOME/.fonts
>    cp $HOME/.dotfiles/fonts/* $HOME/.fonts
>    fc-cache -f -v
>   ```

- Ghostty
> Install Ghostty with:
>   ```sh
>    sudo snap install ghostty --channel=latest/edge --classic
>   ```
> - **With the `latest/edge` version, you can enable *shaders* for advanced graphical effects and animations directly in your terminal!**

Open Ghostty’s default profile settings, set the font to `FiraCode Nerd Font Mono` with size of 12.0.
    ```text
    font-family="FiraCode Nerd Font Mono"
    font-size=12.0
    ```
Or Create a symbolic link to the Ghostty configuration for using this repo configuration:
    ```sh
   ln -s $HOME/.dotfiles/ghostty $HOME/.config/
    ```
Restart Ghostty for the changes to take effect.

You can use your favorite color scheme — or simply copy my Ghostty configuration from the `ghostty` folder in this repository.
In my setup, I use a slightly customized version of the **Argonaut** colorscheme called **Astronaut**. Another colorscheme I really like is **Breeze**.

### Installation

1. **Install essential packages:**
    ```sh
    sudo apt install curl wget nano stow grc ripgrep fd-find eza tree micro python3 python3-pip fzf bat command-not-found git-delta tmux htop
    sudo ln -s /usr/bin/batcat /usr/bin/bat
    ```

2. **Link dotfiles using stow:**
    ```sh
    git clone https://github.com/jandamm/zgenom.git .zgenom 
    git clone https://github.com/unixorn/zsh-quickstart-kit.git .zqs 
    cd $HOME/.zqs && stow --target=$HOME zsh && cd  
    cd $HOME/.dotfiles/zsh && stow --target=$HOME zsh && cd  
    cd $HOME/.dotfiles/zsh && stow --target=$HOME/.zshrc.d zshrc.d && cd
    ```

3. **Fix FZF Autocompletion on Ubuntu Installs**

    ```sh
    mkdir -p $HOME/.fzf/shell
    ln -s /usr/share/doc/fzf/examples/completion.zsh $HOME/.fzf/shell/completion.zsh
    ln -s /usr/share/doc/fzf/examples/key-bindings.zsh $HOME/.fzf/shell/key-bindings.zsh
    ```

4. **Customize Powerlevel10k Prompt**

If you want to change the appearance or behavior of your Powerlevel10k prompt, simply run:

    ```sh
    p10k configure
    ```

This will launch an interactive configuration wizard to help you personalize your prompt.

5. **Restart your terminal.**

---

## 5. 🛠️ Optional Components & Configuration

### ✏️ **Micro**
[**Micro**](https://micro-editor.github.io) is a modern, easy-to-use terminal-based text editor with a clean UI, mouse support, and powerful plugin system.  
Configuration is managed via `~/.config/micro/settings.json`. Micro includes built-in plugins for syntax highlighting, linting, and more.
This repository includes my personal Micro configuration, providing a set of sensible default options so you can start productively right away. To use these defaults, create a symbolic link from `$HOME/.dotfiles/micro` to `$HOME/.config/micro`:

```sh
ln -s $HOME/.dotfiles/micro $HOME/.config/micro
```
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

### 📦 **asdf-vm** (Optional)
[**asdf-vm**](https://asdf-vm.com) **universal runtime version manager** is a single CLI tool to install, switch, and manage different versions of programming languages and other tools per project or globally. It unifies workflows traditionally handled by tools like nvm, rbenv, pyenv, and gvm, offering a clean, consistent interface and a powerful plugin ecosystem.

- Single config file (.tool-versions) tracks all tool/runtime versions for your project and can be checked into version control
- Automatic version switching: as you navigate across project directories, asdf auto-activates the right tool versions defined in .tool-versions
- Modular plugins power support not only for major languages (Node.js, Python, Java, Ruby, etc.), but also for tools like Terraform, kubectl, PostgreSQL, Redis and more
- Shell completions for Bash, Zsh, Fish & Elvish make installing and specifying versions easy with tab-completion

**Installation**
    
    # Install asdf (macOS example)
    brew install asdf openssl readline sqlite3 xz zlib tcl-tk@8 libb2 zstd
    sudo xcode-select --reset
    # Install the "system" version use as default using the latest LTS version
    brew install openjdk@21
    brew install node@22
    #reload term session

    # Or on Linux (with git & zsh)
    sudo apt install default-jdk-headless make build-essential libssl-dev zlib1g-dev \
                    libbz2-dev libreadline-dev libsqlite3-dev curl git \
                    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libstd-dev
    #sudo apt install nodejs install the system version only after installing and selecting an alternative version using asdf (see note at the end)
    mkdir -p $HOME/.asdf/bin
    cd $HOME/.asdf/bin
    wget https://github.com/asdf-vm/asdf/releases/download/v0.18.0/asdf-v0.18.0-linux-amd64.tar.gz
    tar zxvf asdf-v0.18.0-linux-amd64.tar.gz
    rm asdf-v0.18.0-linux-amd64.tar.gz
    #reload term session


**Plugins installation**
    
    asdf plugin add java
    asdf plugin add nodejs
    asdf plugin add python


**Installing & Using Tools**

- **To install a specific version of a tool (for example, Java), you can use Tab completion to see available versions:**

    `asdf install java openjdk-17   # or: asdf install java [TAB]`


- **List installed versions:**

    `asdf list java`


- **Check what is currently in use:**

    `asdf current`
    `asdf current java`


- **Set the global (user-wide) version:**

    `asdf set -u java system`
    # or: asdf set -u java [TAB] to use completion


- **Set the version for a specific project (in the project root):**

    `asdf set java openjdk-17`
    # or: asdf set java [TAB] to use completion


> **Note:**  
> If you do not specify a Java version within a project (i.e., there is no `.tool-versions` file in the project directory), asdf will use the global system version.  
> If you set a specific version for the project (`asdf set java <version>` in the project folder), asdf will automatically switch to that version when you enter the directory or open the project in an editor like VSCode or IntelliJ.

> **Attention (Linux only):**  
> If on Linux asdf is unable to switch the Node.js version (it always stays on the system version even after installing other versions with asdf), you need to:
> 1. Uninstall the system-provided Node.js (`sudo apt remove nodejs`).
> 2. Set the global Node.js version via asdf:
>    ```sh
>    asdf set -u nodejs <desired-version>
>    ```
> 3. If needed, reinstall the system version of Node.js after configuring asdf (`sudo apt install nodejs`).
>
> This ensures that the `node` command points to the version managed by asdf and not the system one.

> **Tip:**  
> In some cases, to list all installed versions of a tool managed by asdf, you may need to install at least one additional version of that tool. This allows asdf to properly list and manage multiple versions on your system.

### 🔀 **tmux**
[**tmux**](https://github.com/tmux/tmux) is a powerful terminal multiplexer that lets you manage multiple terminal sessions within a single window. It supports persistent sessions, split panes, window management, and extensive customization.

This repository includes a custom `~/.tmux.conf` configuration (see `/zsh/zsh/.tmux.conf` in this repo) with the following features:

- **Prefix key:** Uses `Ctrl + A` as the tmux prefix (instead of the default `Ctrl + B`), making it more ergonomic and familiar for users of GNU Screen.
- **Persistent sessions:** Sessions remain active even if you disconnect, allowing you to resume work seamlessly.
- **Plugin Manager:** Integrates [tpm (tmux plugin manager)](https://github.com/tmux-plugins/tpm) for easy plugin installation and management.
- **Custom status bar:** A clean, informative status line showing session, window, and pane information, as well as system stats (date, time, battery, hostname, etc.).
- **Optimized keybindings:** Intuitive shortcuts for splitting panes (`"`, `%`), switching panes (`Alt + Arrow`), resizing, and navigating between windows.
- **Mouse support:** Enables mouse interactions for pane selection, resizing, and window switching.
- **Clipboard integration:** Seamless copy-paste between tmux and the system clipboard (on macOS and Linux with appropriate tools).
- **True color support:** Ensures correct color rendering for modern terminals and themes.
- **Improved pane navigation:** Fast movement between panes and windows, with support for cycling and swapping.
- **Automatic renaming:** Windows automatically rename based on the running command for better context.

**Example workflow:**

1. Start a new tmux session:  
    ```sh
    tmux
    ```
2. Split the window horizontally:  
    `Ctrl + A -`  
    Split vertically:  
    `Ctrl + A /`
3. Move between panes:  
    `Ctrl + A` + Arrow keys
4. Create a new window:  
    `Ctrl + A c`
5. Detach from the session:  
    `Ctrl + A d`
6. Reattach later:  
    ```sh
    tmux attach
    ```
7. Toggle the status bar:  
    `Ctrl + A Ctrl + S`  
8. Sync input to all panes:  
    `Ctrl + S` (without the tmux prefix)  
    (Pressing `Ctrl + S` enables or disables synchronized input, so your keystrokes are sent to all panes at once—useful for running the same command in multiple panes.)

You can further customize tmux by adding the `~/.tmux.conf.local` for your own plugins and keybindings.

### 🔍 **fzf**
[**fzf**](https://github.com/junegunn/fzf) is a fast, interactive fuzzy finder for the command line. It enables you to quickly search, filter, and select from lists of files, processes, command history, git branches, and more—all with a simple, intuitive interface.
**fzf** is already integrated into this dotfiles setup for history search, file completion, and directory navigation. You can further customize its behavior via the `zsh/zshrc.d/20_fzf.zsh` configuration files.

**Key features:**
- Blazing fast fuzzy search for files, directories, processes, and more.
- Seamless integration with Zsh (and other shells) for history search, file completion, and directory navigation.
- Highly customizable with preview windows, keybindings, and color themes.
- Works well with other tools (e.g., `ps`, `kill`, `git`, `docker`).

**Common usage examples:**

- **Find and kill a process:**
    ```sh
    ps aux | fzf --preview 'echo {}' | awk '{print $2}' | xargs kill
    ```
    This command lists all processes, lets you interactively select one, and kills it.

- **Fuzzy search and checkout a git branch:**
    ```sh
    git checkout $(git branch | fzf)
    ```
- **Fuzzy search and view logs of a Docker container:**
    ```sh
    docker ps --format '{{.ID}} {{.Names}}' | fzf | awk '{print $1}' | xargs -r docker logs
    ```

- **Fuzzy search and run a shell in a running Docker container:**
    ```sh
    docker ps --format '{{.ID}} {{.Names}}' | fzf | awk '{print $1}' | xargs -r -I {} docker exec -it {} /bin/sh
    ```
- **Fuzzy open files in your editor:**
    ```sh
    micro $(fzf)
    ```

- **Fuzzy command history search:**  
    - Press <kbd>Ctrl</kbd> + <kbd>R</kbd> to open an interactive fzf-powered search through your shell history. Start typing to filter commands, then press <kbd>Enter</kbd> to execute the selected command.

- **Fuzzy file path completion:**  
    - Press <kbd>Ctrl</kbd> + <kbd>T</kbd> to trigger fzf-based file selection and insert the chosen file path into your command line.

- **Fuzzy cd into a subdirectory:**  
    - Press <kbd>Alt</kbd> + <kbd>C</kbd> (or <kbd>Esc</kbd> + <kbd>C</kbd>) to interactively select a subdirectory and automatically `cd` into it.

**Tip:**  
With **fzf-tab**, you can use the <kbd>Tab</kbd> key to trigger an interactive fzf-powered completion menu for commands, files, and directories. For example, typing `micro <Tab>` will open a fuzzy search menu to quickly select the file you want to edit. This enhances the default shell completion with a fast, searchable interface.

### 🧠 **zsh-autosuggestions**
[**zsh-autosuggestions**](https://github.com/zsh-users/zsh-autosuggestions) provides real-time command suggestions as you type, based on your command history and completions. Suggestions appear in a lighter color and can be accepted by pressing the right arrow key. This greatly speeds up repetitive command entry and helps recall complex commands.

### 🎨 **zsh-syntax-highlighting**
[**zsh-syntax-highlighting**](https://github.com/zsh-users/zsh-syntax-highlighting) highlights commands as you type, making it easy to spot errors before running them. Valid commands are shown in one color, while invalid ones are highlighted differently, improving accuracy and confidence in the terminal.

### 📦 **zsh-completions**
[**zsh-completions**](https://github.com/zsh-users/zsh-completions) adds thousands of additional tab completions for many CLI tools and applications not covered by the default Zsh installation. This makes working with a wide variety of commands faster and more convenient, with intelligent suggestions and argument completion.


### 🛠️ **Other Tools Included**
- 🦇 **bat**: File viewer with syntax highlighting and line numbers.
- 🦸 **ripgrep**: Recursive file search, much faster than `grep`.
- 📁 **eza**: Directory listing with colors, icons, and detailed info.
- 🔍 **fd**: Simple, fast and user-friendly alternative to find
- ⚙️ **coreutils**: GNU File, Shell, and Text utilities
- 🌳 **tree**: Display directories as trees (with optional color/HTML output)
-  **git**: Distributed version control system for tracking changes in source code.
- 🌐 **wget**: Internet file retriever
- 🎨 **grc**: Colorize logfiles and command output


---

## 5. ⌨️ Keybindings

### 🐚 Zsh
- `Ctrl + R` — Search history (fzf).
- `Double Esc` — Insert sudo before last command.
- `Ctrl + T` — Fuzzy file path completion (fzf).
- `Alt + C` / `Esc + C` — Cd into a selected subdirectory (fzf).
- `Tab` — Open Autocomplete with fzf menu (fzf-tab).
- `Alt + H` — Toggle hidden files in FZF (fzf).

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
- `Ctrl + A /` — Horizontal split.
- `Ctrl + A -` — Vertical split.
- `Ctrl + S (Without the tmux prefix)` — Multiple panes input broadcast.
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
## 6. 🔐 SSH Configuration

This repository includes a custom SSH configuration to enhance security, usability, and productivity for SSH usage on both macOS and Linux.
The SSH configuration is found in the `ssh` folder within this repository (`$HOME/.dotfiles/ssh`). Using GNU Stow, this directory is automatically linked to `$HOME/.ssh`, replacing any existing files.

```ssh
mkdir -p "$HOME/.ssh" && cd "$HOME/.dotfiles" && stow --target="$HOME/.ssh" ssh && cd
```
### 📄 Configuration files

- **config**  
    The main SSH configuration file (`$HOME/.ssh/config`).  
- **local.sshconfig**  
    A local SSH configuration file (`$HOME/.ssh/local.sshconfig`) that can be used to define host-specific settings without modifying the main config file. This allows you to keep your personal or work-specific SSH configurations separate and modular.

**Why use a local SSH config?**
- **No merge conflicts:** You can update your fork of this repository without worrying about conflicts in your personal SSH settings.
- **Privacy:** Sensitive information (the hosts you access) stays out of your public dotfiles.
 

#### Example: Default SSH Configuration

```ssh
Host *
        IgnoreUnknown UseKeychain
        AddKeysToAgent yes        # Automatically adds keys to ssh-agent
        UseKeychain yes           # macOS-specific: Load keys from keychain
        IdentityFile ~/.ssh/id_rsa  # Default SSH key
        Compression yes           # Enable compression for faster transfers
        ServerAliveInterval 60    # Keep connection alive every 60s
        ServerAliveCountMax 5     # Disconnect after 5 failed keepalive responses
        TCPKeepAlive yes          # Keep TCP connections alive
        ControlMaster auto        # Allow connection multiplexing
        ControlPath ~/.ssh/control-%r@%h:%p  # Socket for multiplexing
        ControlPersist 10m        # Keep connection open for 10 minutes after use

Include ~/.ssh/local.sshconfig
```

#### Option explanations

- `Host *`: Applies these settings to all SSH connections.
- `IgnoreUnknown UseKeychain`: Ignores unknown options except `UseKeychain` (for compatibility).
- `AddKeysToAgent yes`: Automatically adds private keys to the ssh-agent for easier authentication.
- `UseKeychain yes`: On macOS, stores and loads SSH passphrases from the system keychain.
- `IdentityFile ~/.ssh/id_rsa`: Default private key used for authentication.
- `Compression yes`: Enables compression to speed up data transfer.
- `ServerAliveInterval 60`: Sends a keepalive message every 60 seconds to keep the connection active.
- `ServerAliveCountMax 5`: Disconnects after 5 missed keepalive responses.
- `TCPKeepAlive yes`: Ensures TCP-level keepalive packets are sent.
- `ControlMaster auto`: Enables SSH connection multiplexing, allowing multiple sessions over a single connection.
- `ControlPath ~/.ssh/control-%r@%h:%p`: Path for the control socket used by multiplexing.
- `ControlPersist 10m`: Keeps the master connection open for 10 minutes after the last session closes.
- `Include ~/.ssh/local.sshconfig`: Allows you to modularize your configuration by including additional settings from another file without changing this one.

This is an example of local SSH configuration file (`$HOME/.ssh/local.sshconfig`):

```ssh
# GitHub (with a custom SSH key)
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_github
    IdentitiesOnly yes

# GitHub (work account)
Host github.com-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_work
    IdentitiesOnly yes

# Example remote server
Host myserver
    HostName myserver.example.com
    User myuser
    IdentityFile ~/.ssh/id_rsa_myserver
    ForwardAgent yes  # Forward SSH keys to the remote server
    Port 22
    IdentitiesOnly yes

# Shortcut for connecting to a Raspberry Pi
Host pi
    HostName 192.168.1.100
    User pi
    IdentityFile ~/.ssh/id_rsa_pi
    Port 22

# Shortcut for a jump host (SSH through another machine)
Host internal-server
    HostName internal.example.com
    User myuser
    ProxyJump jump-host.example.com  # Use a jump server
    IdentityFile ~/.ssh/id_rsa_internal

# Fast SCP/SFTP transfers
Host fast-transfer
    HostName remote.example.com
    User myuser
    IdentityFile ~/.ssh/id_rsa
    Ciphers aes128-gcm@openssh.com,aes256-gcm@openssh.com
    KexAlgorithms curve25519-sha256@libssh.org
    MACs hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com
```
---

## 7. 🐙 Git Configuration

This repository includes a default `.min.gitconfig` for general Git usage. However, you can easily extend or override this configuration without modifying the repository’s file by creating your own local configuration at `$HOME/.config/git/local.gitconfig`.

**Why use a local Git config?**
- **No merge conflicts:** You can update your fork of this repository without worrying about conflicts in your personal Git settings.
- **Privacy:** Sensitive information (like your name or email) stays out of your public dotfiles.
- **Multiple accounts:** Easily manage different Git identities (e.g., work and personal) by automatically switching user/email based on the project directory.

**How it works:**
- The main `.config` in this repository includes (if present) your `$HOME/.config/git/local.gitconfig`.

**To set up your Git configuration using GNU Stow, run:**

```sh
    # Uses `stow` to create symlinks from the `git` folder in your dotfiles to `$HOME/.config/git`, ensuring your Git configuration files are managed and updated via your dotfiles.
    mkdir -p $HOME/.config/git && cd $HOME/.dotfiles && stow --target=$HOME/.config/git git && cd
```
**Note:**  
I use the `$HOME/Developer` folder as my main projects directory because on macOS this folder has a custom "fancy" icon, making it easily recognizable in Finder. On Ubuntu, the default folder is `$HOME/Develop`, but I usually rename it to `$HOME/Developer` to keep the same configuration and directory structure across both operating systems.

**Example `local.gitconfig`:**
```ini
[user]
    name = myname
    email = mayname@email.xxx

[includeIf "gitdir:~/Developer/personal@github/"]
    path = ./gitconfig.personal@github
[includeIf "gitdir:~/Developer/work@github/"]
    path = ./gitconfig.work@github
```

**Example of an included config (e.g., `gitconfig.work@github`):**
```ini
[user]
    name = myworkname
    email = myworkname@email.xxx
```

With this setup, Git will automatically use the correct user and email for each project, based on its directory. This is especially useful if you contribute to both personal and work repositories from the same machine.

---

## 8. 🛠️ Customizing Your Zsh Quickstart Kit

### Customizing with ~/.zshrc.d Fragment Files

The `.zshrc` included in the Zsh Quickstart kit will automatically source any files it finds in `~/.zshrc.d`. This happens after plugins are loaded. If you need to set variables or aliases before plugins are loaded, create files in `~/.zshrc.pre-plugins.d`.

This makes it easy for you to add extra functions and aliases without having to maintain a separate fork of this repository and allows you to configure the behavior of some of the plugins by setting environment variables.

The files will be sourced in alphanumeric order after loading all the plugins, and I suggest you use a naming scheme of `001-onething`, `002-something-else` etc., to ensure they're loaded in the order you expect.

After the quickstart sets up its aliases, functions, plugins and ZSH options, it will source every fragment file in `~/.zshrc.d`.

To make it easier to have macOS, FreeBSD or Linux-specific settings tweaks, the quickstart also supports OS-specific pre & post `.zshrc.d` directories. If you want a file to only be sourced on a single OS, the quickstart also checks for `.zshrc.pre-plugins.$(uname).d` and `~/.zshrc.$(uname).d` during loading.

For your convenience, the quickstart will also look for a `.zshrc.work.d` directory, and if it's present, load fragment files from there. This lets you have a separate directory in your dotfiles repository for work-specific customizations.

### Self-update Settings

The quickstart kit will automatically check for updates every seven days. If you want to change the interval, set `QUICKSTART_KIT_REFRESH_IN_DAYS` in a file in `~/.zshrc.d`. If you're going to disable self-updating entirely, add `unset QUICKSTART_KIT_REFRESH_IN_DAYS` in a file in `~/.zshrc.d`.

### Customizing the plugin list

I've included what I think is a good starter set of ZSH plugins in this repository. However, everyone has their preferences for their environment.
To make things easier to customize without users having to maintain their own forks, the kit provides two ways to customize the list of plugins it will load.
You can either add a fragment file to `~/.zshrc.add-plugins.d`, or you can make a `~/.zsh-quickstart-local-plugin` file.

#### Complete plugin list replacement

If you don't care about future changes to the kit's plugins and want to fully replace the built-in list, then create a `~/.zsh-quickstart-local-plugins` file. When the kit detects a file named `~/.zsh-quickstart-local-plugins`, its `.zshrc` will source that **instead** of running the `load-starter-plugin-list` function defined in `~/.zgen-setup`.

**Using `~/.zsh-quickstart-local-plugins` is not additive. It will *completely replace* the kit-provided list of plugins.** If you want to just add more plugins, use the fragment file method above.

Creating a `.zsh-quickstart-local-plugins` from scratch is a pain, so to make customizing your plugin list easier, I've included a `.zsh-quickstart-local-plugins-example` file at the root of the repository that installs the same plugin list that the kit does by default that you can use as a starting point for your own `.zsh-quickstart-local-plugins` file.

Copy that to your `$HOME/.zsh-quickstart-local-plugins`, change the list, and the next time you start a terminal session, you'll get your plugin list loaded instead of the kit's defaults.


