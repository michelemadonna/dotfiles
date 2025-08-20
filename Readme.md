# ⚡️ Dotfiles for Zsh on macOS  & Ubuntu 🐧 (>= 24.04)

Welcome to my personal dotfiles repository! This is a comprehensive collection of my Zsh configurations, finely tuned for both macOS and Ubuntu Linux (version 24.04 and newer). The entire setup is built upon the solid foundation of the [zsh-quickstart-kit](https://github.com/unixorn/zsh-quickstart-kit) and integrates a suite of powerful terminal applications. Each component is configured to maximize productivity, speed, and comfort for your daily command-line work.

## ⚙️ How the Zsh Configuration Works

This setup leverages the `.zshrc` from the `zsh-quickstart-kit` as the main configuration entry point. To ensure stability and easy updates, **direct modifications to this file are discouraged**. The framework is designed to manage its own updates and those of its plugins, guaranteeing you always benefit from the latest improvements automatically.

Configuration is managed through a clean, modular approach:

-   **`stow`** is used to create symbolic links from this repository to your home directory, seamlessly connecting the kit’s `.zshrc` and all your custom configuration files.
-   **Customizations should never be made directly in the framework’s `.zshrc`**. Instead, place your personalized settings in:
    -   `$HOME/.dotfiles/zsh/zshrc.d/` for general configuration snippets.
    -   `$HOME/.dotfiles/zsh/zshrc.pre-plugins` for environment variables or any code that must run *before* plugins are loaded.
-   The list of Zsh plugins to be loaded is defined in `$HOME/.dotfiles/zsh/zsh/.zsh-quickstart-local-plugins`.

This structure keeps your custom settings neatly separated from the core framework, making future updates both straightforward and safe.

---

## 1. 🧩 Components Used

This configuration brings together a curated set of powerful command-line tools to create a cohesive and efficient environment.

-   🐚 **Zsh**: The main shell, chosen for its power and extensive customization capabilities.
-   ⚡️ **zgenom**: A lightweight and exceptionally fast Zsh plugin manager.
-   🚀 **zsh-quickstart-kit**: Provides a rock-solid foundation for the entire Zsh configuration.
-   ✏️ **micro**: A modern, intuitive, and mouse-friendly terminal-based text editor. (You are, of course, free to use any editor you prefer).
-   🔀 **tmux**: A powerful terminal multiplexer for managing multiple windows, panes, and sessions.
-   📦 **asdf**: A versatile version manager for programming languages and other tools (optional).
-   🔍 **fzf**: A blazing-fast, interactive fuzzy finder integrated throughout the shell.
-   🦇 **bat**: A superior alternative to `cat` with syntax highlighting and Git integration.
-   🦸 **ripgrep**: An ultra-fast, recursive file search tool that respects your `.gitignore`.
-   📁 **eza**: A modern replacement for `ls` with beautiful colors, icons, and useful metadata.
-   🧠 **zsh-autosuggestions**: Fish-like command suggestions based on your history, displayed as you type.
-   🎨 **zsh-syntax-highlighting**: Provides real-time syntax highlighting for commands in the terminal.
-   🛠️ **Other tools**: A suite of essentials including `z`, `git`, `duf`, `wget`, `htop`, and many more.

The `zsh-quickstart-kit` includes the [powerlevel10k](https://github.com/romkatv/powerlevel10k) ZSH theme, which requires a Powerline-compatible font to render its iconic status glyphs. For this purpose, my configuration uses [Nerd fonts](https://github.com/ryanoasis/nerd-fonts), a collection of over 20 patched fonts (with more than 1,700 variations) that provide an extensive set of glyphs. This includes popular fonts like Droid Sans, Meslo, Fira Code, Inconsolata, and more.

### 🪐 Ghostty Terminal

[Ghostty](https://github.com/ghostty-org/ghostty) is a modern, open-source terminal emulator that is lightweight, GPU-accelerated, and cross-platform (macOS  and Ubuntu 🐧).

I chose Ghostty because it is:
-   **Cross-platform:** It works seamlessly on both macOS and Ubuntu, ensuring a consistent experience.
-   **Easy to install:** Available via Homebrew on macOS and Snap on Ubuntu.
-   **Simple to configure:** Just apply the configuration file included in this repository to instantly get my personalized setup.

**Advantages of Ghostty:**
-   High performance with minimal resource usage.
-   Native GPU rendering and advanced Unicode support.
-   Extensive customization for fonts, colors, and layouts.
-   **The `nightly build` version enables *shaders*, allowing for advanced graphical effects and animations directly in your terminal!**

This repository includes my personal Ghostty configuration, which applies a slightly customized version of the **Argonaut** theme called **Astronaut**. Another color scheme I really like, **Breeze**, is also included.

### ⚡️ zgenom

zgenom is a plugin manager for Zsh that loads themes and plugins in a modular and extremely fast way. It uses smart caching to dramatically reduce shell startup times and supports plugins from Oh-my-zsh and other sources.

### 🚀 zsh-quickstart-kit

The zsh-quickstart-kit offers a thoughtfully organized set of Zsh configurations and plugins, aiming to deliver a reliable, secure, and flexible starting point for your shell environment. It brings together recommended practices, a curated plugin selection, and a clear structure to help you manage and extend your dotfiles with ease.

With the zsh-quickstart-kit, your Zsh setup benefits from:

*   Automated, regular updates for both `zgenom` and all enabled plugins.
*   Shared command history across all open Zsh sessions.
*   Automatic removal of duplicate entries in your command history.
*   Enhanced tab completion, powered by the [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) project.
*   Powerful, interactive history search using [fzf](https://github.com/junegunn/fzf).
*   Real-time syntax highlighting as you type commands.
*   Support for [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)-style plugins and themes.
*   Handy macOS-specific utilities that load only on macOS, keeping your configuration portable.
*   Automatic loading of iTerm2 shell integration if it’s installed.

This kit is designed to work seamlessly on both macOS and Linux, making it easy to maintain a consistent and productive shell experience across platforms.

#### Included plugins

-   [chrissicool/zsh-256color](https://github.com/chrissicool/zsh-256color) - Sets your terminal to 256 colors if available.
-   [djui/alias-tips](https://github.com/djui/alias-tips) - Reminds you if an alias exists for a command you just typed.
-   [eventi/noreallyjustfuckingstopalready](https://github.com/eventi/noreallyjustfuckingstopalready) - Deals with Apple's quirky DNS resolver (macOS only).
-   [peterhurford/git-it-on.zsh](https://github.com/peterhurford/git-it-on.zsh) - Opens your current repo on GitHub.
-   [robSis/zsh-completion-generator](https://github.com/RobSis/zsh-completion-generator) - Generates Zsh completion functions from `--help` output.
-   [sharat87/pip-app](https://github.com/sharat87/pip-app) - Eases installation of utilities distributed with `pip`.
-   [skx/sysadmin-util](https://github.com/skx/sysadmin-util) - A collection of useful scripts for sysadmins.
-   [stackexchange/blackbox](https://github.com/stackexchange/blackbox) - Store secrets in a repo with GnuPG encryption.
-   [unixorn/1password-op.plugin.zsh](https://github.com/unixorn/1password-op.plugin.zsh) - Tab completions for the 1Password `op` CLI.
-   [unixorn/autoupdate-zgenom](https://github.com/unixorn/autoupdate-zgenom) - Adds autoupdate functionality to `zgenom`.
-   [unixorn/fzf-zsh-plugin](https://github.com/unixorn/fzf-zsh-plugin) - Enables `fzf`-powered history search.
-   [unixorn/git-extra-commands](https://github.com/unixorn/git-extra-commands) - A collection of extra helper scripts for `git`.
-   [unixorn/jpb.zshplugin](https://github.com/unixorn/jpb.zshplugin) - Useful standard aliases & functions.
-   [unixorn/tumult.plugin.zsh](https://github.com/unixorn/tumult.plugin.zsh) - Adds macOS-specific functions and scripts (macOS only).
-   [zdharma-continuum/fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) - Fast syntax highlighting as you type.
-   [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - fish-like autosuggestions.
-   [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) - Tab completions for many more applications.
-   [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) - Better history search.
-   [Aloxaf/fzf-tab](https://github.comcom/Aloxaf/fzf-tab) - Replace zsh's default completion selection menu with fzf.

The kit also uses `zgenom` to load these oh-my-zsh plugins:
`aws`, `brew` (macOS), `colored-man`, `git`, `github`, `osx` (macOS), `pip`, `python`, `rsync`, `screen`, `sudo`, `asdf`, `kubectl`, `docker`.

---

## 2. 🍏 Installation on macOS

> **Note:** Zsh is the default shell on macOS starting from version 10.15 (Catalina).

### 2.1 Prerequisites

#### - Homebrew
If you don't have it installed, get it with:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### - A Powerline-compatible font
Install the recommended Fira Code Nerd Font:
```sh
brew install font-fira-code-nerd-font
```

#### - A fork of this repo on GitHub and Clone **your forked** repository on your local machine
```sh
git clone https://github.com/your-username/dotfiles.git $HOME/.dotfiles
```

#### - Ghostty
Install the latest version of Ghostty:
```sh
brew install ghostty@tip
```
> **Note:** The `@tip` version is the nightly build, which includes shader support for advanced graphical effects.

Next, configure Ghostty. You can either open its default settings and manually set the font to `FiraCode Nerd Font Mono` with a size of `12.0`:
```text
font-family="FiraCode Nerd Font Mono"
font-size=12.0
```
or simply create a symbolic link to use the config from this repo:
```sh
ln -s $HOME/.dotfiles/ghostty $HOME/.config/
```
Restart Ghostty for the changes to take effect. 
> ⚠️ **Mouse Reporting:** by default, Ghostty is configured to transparently report mouse events to terminal applications. You can hold down the <kbd>Shift</kbd> key to bypass mouse reporting temporarily

> ⚠️ **Copying Text from Terminal Applications:** in Ghostty, if standard copy doesn't work inside an app like tmux, **hold the <kbd>Shift</kbd> key while selecting text with your mouse, then press <kbd>Cmd</kbd> + <kbd>C</kbd>**. This bypasses the application's mouse handling and lets the OS capture the text.

<details>
<summary>💡 <strong>Other Recommended Terminal: iTerm2</strong></summary>

[iTerm2](https://iterm2.com/) is a powerful and feature-rich terminal emulator for macOS. This repository includes my personal iTerm2 configuration and color schemes (Argonaut, Breeze) for a consistent experience.

**Advantages of iTerm2:**
-   Highly customizable with profiles, color schemes, and fonts.
-   Advanced features like split panes, search, triggers, and inline images.
-   Excellent integration with macOS, including system clipboard and keychain.
-   Built-in support for Powerline and Nerd Fonts.

Install iTerm2 with:
```sh
brew install --cask iterm2
```
To apply my custom settings, follow these steps in iTerm2's **Preferences**:
-   `General` -> `Selection` -> Uncheck `"Command selection: Clicking on command selects it to restrict Find and Filter"`
-   `General` -> `Selection` -> Check `"Access: Application in terminal may access clipboard"`
-   `Appearance` -> `General` -> `Theme` -> Select `"Minimal"`
-   `Pointer` -> `General` -> `Mouse Reporting` -> Check `"^-Click reported to apps, does not open menu"`
-   `Profiles` -> `Default` -> `Other Actions...` -> `Duplicate Profile` -> Name it `"Astronaut Alternative Lighter"`
-   In the new profile:
    -   `Colors` -> Uncheck `"Modes : Use separate colors for light and dark mode"`
    -   `Colors` -> `Color Presets` -> `Import...` -> Import `"$HOME/.dotfiles/iTerm2/Color Schemes/Astronaut Alternative Lighter.iTermColors"`
    -   `Colors` -> `Color Presets` -> Select `"Astronaut Alternative Lighter"`
    -   `Colors` -> `Minimum Contrast` -> `7`
    -   `Text` -> `Cursor` -> Check `"Blink"` and `"Animate movement"`
    -   `Text` -> `Text rendering` -> Check `"Allow blinking text"`
    -   `Text` -> `Font` -> Select `"Fira Code Nerd Font Mono"`, `"Retina"`, size `12`
    -   `Terminal` -> `Shell Integration` -> Uncheck `"Show mark indicators"`
    -   `Session` -> `Password Manager` -> Check `"Open password manager automatically..."`
    -   `Keys` -> `General` -> `Left Option key` -> Select `"Esc+"`
-   Finally, `Profile` -> `"Astronaut Alternative Lighter"` -> `Other Actions...` -> `Set as Default`
On macOS, you may also want to adjust `System Settings -> Appearance -> Show Scroll Bars -> Select "When scrolling"`.

> ⚠️ **Mouse Reporting:** by default, iTerm2 is configured to transparently report mouse events to terminal applications, except for right-click actions. You can temporarily enable right-click reporting by holding the <kbd>Command</kbd> key while clicking, or enable it permanently in the settings:  
`General` → `Pointer` → `General` → Check `"Right Click reported to the apps, does not open menu"`. If you want to disable mouse reporting entirely, you can do so in the same settings menu. Alternatively, you can hold down the <kbd>Option</kbd> key to bypass mouse reporting temporarily.

> ⚠️ **Copying Text from Terminal Applications :** to copy text from tmux or similar apps, **hold the <kbd>Option</kbd> key while selecting text with your mouse, then press <kbd>Command</kbd> + <kbd>C</kbd>**.

</details>

### 2.2 Installation

1.  **Install essential packages:**
    ```sh
    brew tap "homebrew/command-not-found"
    brew install coreutils bat eza fd git-delta htop ripgrep stow tmux tree wget git micro
    ```

2.  **Link dotfiles using stow:**
    ```sh
    git clone https://github.com/jandamm/zgenom.git $HOME/.zgenom
    git clone https://github.com/unixorn/zsh-quickstart-kit.git $HOME/.zqs
    cd $HOME/.zqs && stow --target=$HOME zsh && cd
    cd $HOME/.dotfiles/zsh && stow --target=$HOME zsh && cd
    cd $HOME/.dotfiles/zsh && stow --target=$HOME/.zshrc.d zshrc.d && cd
    ```

3.  **Restart your terminal.**

4.  **Customize Powerlevel10k Prompt:**
    If you want to change the appearance of your prompt, simply run:
    ```sh
    p10k configure
    ```
    This will launch an interactive wizard to personalize your prompt.

---

## 3. 🐧 Installation on Linux (Ubuntu)

### 3.1 Prerequisites

#### - A fork of this repo on GitHub

#### - Git & Zsh
```sh
sudo apt update
sudo apt install git zsh
# Set Zsh as your default shell
chsh -s $(which zsh)
```
Log out and log back in for the changes to take effect.

#### - Clone **your forked** repository
```sh
git clone https://github.com/your-username/dotfiles.git $HOME/.dotfiles
```

#### - Install a Powerline-compatible font
```sh
mkdir -p $HOME/.fonts
cp $HOME/.dotfiles/fonts/* $HOME/.fonts
fc-cache -f -v
```

#### - Install Ghostty
```sh   
sudo snap install ghostty --channel=latest/edge --classic
```
> **Note:** The `latest/edge` channel provides the newest features, including shader support.

Next, open Ghostty and set the font to `FiraCode Nerd Font Mono` with a size of `12.0`:
```text
font-family="FiraCode Nerd Font Mono"
font-size=12.0
```
or link the configuration from this repo:
```sh
ln -s $HOME/.dotfiles/ghostty $HOME/.config/
```
Restart Ghostty for the changes to take effect.

> ⚠️ **Mouse Reporting:**  by default, Ghostty is configured to transparently report mouse events to terminal applications. You can hold down the <kbd>Shift</kbd> key to bypass mouse reporting temporarily.

### 3.2 Installation

1.  **Install essential packages:**
    ```sh
    sudo apt install curl wget stow grc ripgrep fd-find eza tree micro python3-pip bat command-not-found git-delta tmux htop
    # Create a symlink so `bat` can be called instead of `batcat`
    sudo ln -s /usr/bin/batcat /usr/bin/bat
    ```

2.  **Link dotfiles using stow:**
    ```sh
    git clone https://github.com/jandamm/zgenom.git $HOME/.zgenom
    git clone https://github.com/unixorn/zsh-quickstart-kit.git $HOME/.zqs
    cd $HOME/.zqs && stow --target=$HOME zsh && cd
    cd $HOME/.dotfiles/zsh && stow --target=$HOME zsh && cd
    cd $HOME/.dotfiles/zsh && stow --target=$HOME/.zshrc.d zshrc.d && cd
    ```

3.  **Restart your terminal.**

4.  **Customize Powerlevel10k Prompt:**
    To personalize your prompt's appearance, run the interactive wizard:
    ```sh
    p10k configure
    ```

---

## 4. 🛠️ Optional Components & Configuration

### ✏️ **Micro**
[**Micro**](https://micro-editor.github.io) is a modern, easy-to-use terminal-based text editor with a clean UI, mouse support, and a powerful plugin system. This repository includes my personal Micro configuration to get you started productively. To use it, create a symbolic link:
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
1. Press <kbd>Ctrl</kbd> + <kbd>E</kbd> to open the command bar and type `open myfile.txt` to open a file.
2. Press <kbd>Ctrl</kbd> + <kbd>E</kbd> and type `hsplit` to create a horizontal split.
3. In the new split (bottom pane), press <kbd>Ctrl</kbd> + <kbd>E</kbd> and type `term` to open a terminal.

This allows you to edit files and run terminal commands side by side within Micro.

> ⚠️ **macOS Clipboard Alert:** on macOS, you **cannot use <kbd>Command</kbd> + <kbd>C</kbd> to copy text in Micro**—neither for pasting inside Micro nor into other applications. **Always use <kbd>Ctrl</kbd> + <kbd>C</kbd> to copy text within Micro.**. However, you can use <kbd>Command</kbd> + <kbd>V</kbd> to paste text both inside Micro and into other apps.


### 📦 **asdf-vm** (Optional)
[**asdf-vm**](https://asdf-vm.com) is a universal runtime version manager. It's a single CLI tool to manage multiple versions of languages and tools like Node.js, Python, Java, kubectl, and more. It uses a `.tool-versions` file to switch versions automatically as you navigate directories.

#### Installation
**macOS Installation**
```sh
# Install asdf and dependencies
brew install asdf
brew install openssl readline sqlite3 xz zlib tcl-tk@8 libb2 zstd
# Install system versions of tools
brew install openjdk node
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# Reload terminal session
```

**Linux Installation**
```sh
# Install dependencies and system versions of tools
sudo apt install default-jdk-headless nodejs make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libgdbm-dev libc6-dev libzstd-dev \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
# Install asdf (check GitHub for latest version)
mkdir -p ~/.asdf/bin && cd ~/.asdf/bin && \
wget https://github.com/asdf-vm/asdf/releases/download/v0.18.0/asdf-v0.18.0-linux-amd64.tar.gz && \
tar zxvf asdf-v0.18.0-linux-amd64.tar.gz && \
rm asdf-v0.18.0-linux-amd64.tar.gz
# Reload terminal session
```

#### Usage
```sh
# Add plugins for languages
asdf plugin add java
asdf plugin add nodejs
asdf plugin add python

# Install a specific version
asdf install java openjdk-22 #or asdf install java + [TAB] to list available versions using completion

# Set the system provided tool version as the global version (user-wide)
asdf set -u java system #or asdf set -u java + [TAB] to list installed versions using completion

# Set the local (project-specific) version
asdf set java openjdk-22 #or asdf set java + [TAB] to list installed versions using completion
```
> **Note:**  
> If you do not specify a Java version within a project (i.e., there is no `.tool-versions` file in the project directory), asdf will use the global system version.  
> If you set a specific version for the project (`asdf set java <version>` in the project folder), asdf will automatically switch to that version when you enter the directory or open the project in an editor like VSCode or IntelliJ.

> **⚠️ Attention:**
> If on Linux, asdf is unable to switch the Node.js version (it always stays on the system version even after installing other versions with asdf), you need to:
>     1. Uninstall the system-provided Node.js (`sudo apt remove nodejs`).
>     2. Set the global Node.js version via asdf:
>     ```sh
>     asdf set -u nodejs <desired-version>
>     ```
>     3. If needed, reinstall the system version of Node.js after configuring asdf (`sudo apt install nodejs`).
> This ensures that the `node` command points to the version managed by asdf and not the system one.
> On macOS, after running asdf install python, you might see a warning such as: `xcode-select: error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance` To fix this, run: `sudo xcode-select --reset`

> **Tip:**  
> In some cases, to list all installed versions of a tool managed by asdf, you may need to install at least one additional version of that tool. This allows asdf to properly list and manage multiple versions on your system.

### 🔀 **tmux**
[**tmux**](https://github.com/tmux/tmux) is a terminal multiplexer that lets you manage multiple terminal sessions within a single window. The custom `$HOME/.tmux.conf` included in this repository features an ergonomic <kbd>Ctrl</kbd> + <kbd>A</kbd> prefix, persistent sessions, a clean status bar, intuitive keybindings, mouse support, and clipboard integration.

#### Example workflow:
1.  Start a new session: `tmux`
2.  Split window horizontally: <kbd>Ctrl</kbd>+<kbd>A</kbd> then <kbd>-</kbd>
3.  Split vertically: <kbd>Ctrl</kbd>+<kbd>A</kbd> then <kbd>|</kbd>
4.  Move between panes: <kbd>Ctrl</kbd>+<kbd>A</kbd> then + <kbd>↑</kbd> / <kbd>↓</kbd> / <kbd>←</kbd> / <kbd>→</kbd>
5.  Resize panes: <kbd>Ctrl</kbd>+<kbd>A</kbd> then <kbd>Shift</kbd> + <kbd>↑</kbd> / <kbd>↓</kbd> / <kbd>←</kbd> / <kbd>→</kbd>
6.  Detach from session: <kbd>Ctrl</kbd>+<kbd>A</kbd> then <kbd>D</kbd>
7.  Reattach to the last session: `tmux attach`
8.  Toggle the status bar: <kbd>Ctrl</kbd> + <kbd>A</kbd> then <kbd>Ctrl</kbd> + <kbd>S</kbd>
9.  Sync input to all panes: <kbd>Ctrl</kbd> + <kbd>A</kbd> then <kbd>Alt</kbd> + <kbd>S</kbd>
    (This enables or disables synchronized input, so your keystrokes are sent to all panes at once—useful for running the same command in multiple panes.)


> 🖱️ **Mouse support** is fully enabled in tmux: you can seamlessly move between panes and windows, resize them, scroll, and interact directly using your mouse. By right-clicking and holding on Ghostty, the **tmux context menu** will open. If you are using iTerm, you also need to hold the <kbd>Command</kbd> key while right-clicking.

### 🔍 **fzf**
[**fzf**](https://github.com/junegunn/fzf) is a fast, interactive fuzzy finder that is deeply integrated into this setup. It powers history search, file completion, and directory navigation, making your command-line interactions incredibly efficient. With the `fzf-tab` plugin, you can press <kbd>Tab</kbd> to trigger an fzf-powered completion menu for almost any command, files, and directories. For example, typing `micro <Tab>` will open a fuzzy search menu to quickly select the file you want to edit. 

#### Common usage examples:
-   **Fuzzy history search:** Press <kbd>Ctrl</kbd> + <kbd>R</kbd> to search your shell history.
-   **Fuzzy file path completion:** Press <kbd>Ctrl</kbd> + <kbd>T</kbd> to find a file and insert its path.
-   **Fuzzy cd into a subdirectory:** Press <kbd>Alt</kbd> + <kbd>C</kbd> to find and `cd` into a directory.
-   **Kill a process interactively:** Type `kill` and press <kbd>Tab</kbd> to select a process to kill.
-   **Run a Docker container:** Type `docker run` and press <kbd>Tab</kbd> to select a container to run.
-   **Checkout a git branch:** Type `git checkout` and press <kbd>Tab</kbd> to select a branch.

---
## 5. ⌨️ Keybindings

### 🐚 Zsh

| Key                                                           | Action                                        |
| ------------------------------------------------------------- | --------------------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>R</kbd>                                | Search history (fzf).                         |
| <kbd>Esc</kbd> + <kbd>Esc</kbd>                               | Insert `sudo` before the last command.        |
| <kbd>Ctrl</kbd> + <kbd>T</kbd>                                | Fuzzy file path completion (fzf).             |
| <kbd>Alt</kbd> + <kbd>C</kbd> / <kbd>Esc</kbd> + <kbd>C</kbd> | `cd` into a selected subdirectory (fzf).      |
| <kbd>Tab</kbd>                                                | Open autocomplete menu with fzf (fzf-tab).    |
| <kbd>Alt</kbd> + <kbd>H</kbd>                                 | Toggle hidden files in FZF search.            |

### 🔍 fzf

| Key                                                           | Action                                     |
| ------------------------------------------------------------- | ------------------------------------------ |
| <kbd>↑</kbd>/<kbd>↓</kbd>                                     | Move up/down.                              |
| <kbd>Tab</kbd>                                                | Cycle selection.                           |
| <kbd>Ctrl</kbd> + <kbd>Space</kbd>                            | Mark/unmark item.                          |
| <kbd>Ctrl</kbd> + <kbd>A</kbd>                                | Toggle all marked/unmarked.                |
| <kbd>Enter</kbd>                                              | Select the current item(s).                |
| <kbd>Ctrl</kbd> + <kbd>P</kbd>                                | Toggle the preview window.                 |
| <kbd>Ctrl</kbd> + <kbd>O</kbd>                                | Move the preview window.                   |
| <kbd>Ctrl</kbd> + <kbd>J</kbd>/<kbd>K</kbd>                   | Scroll preview window down/up.             |
| <kbd>Ctrl</kbd> + <kbd>O</kbd>                                | Move the preview window.                   |
| <kbd>,</kbd>/<kbd>.</kbd>                                     | Switch group (fzf-tab).                    |

### 🔀 tmux

| Key                                                                                             | Action                             |
| ------------------------------------------------------------------------------------------------| ---------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>A</kbd>                                                                  | Prefix key (instead of <kbd>Ctrl</kbd>+<kbd>B</kbd>). |
| `Prefix` + <kbd>C</kbd>                                                                         | New window.                        |
| `Prefix` + <kbd>-</kbd>                                                                         | Horizontal split.                  |
| `Prefix` + <kbd>|</kbd>                                                                         | Vertical split.                    |
| `Prefix` + <kbd>d</kbd>                                                                         | Detach session.                    |
| `Prefix` + <kbd>+</kbd>                                                                         | Zoom the current pane.             |
| `Prefix` + <kbd>Ctrl</kbd> + <kbd>↑</kbd>/<kbd>↓</kbd>/<kbd>←</kbd>/<kbd>→</kbd>                | Move between panes.                |
| `Prefix` + <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>↑</kbd>/<kbd>↓</kbd>/<kbd>←</kbd>/<kbd>→</kbd> | Resize panes.                  |

### ✏️ micro

| Key                                                              | Action                           |
| ---------------------------------------------------------------- | -------------------------------- |
| <kbd>Ctrl</kbd> + <kbd>O</kbd>                                   | Open file                        |
| <kbd>Ctrl</kbd> + <kbd>S</kbd>                                   | Save                             |
| <kbd>Ctrl</kbd> + <kbd>Q</kbd>                                   | Quit                             |
| <kbd>Ctrl</kbd> + <kbd>F</kbd>                                   | Find                             |
| <kbd>Ctrl</kbd> + <kbd>Z</kbd> / <kbd>Ctrl</kbd> + <kbd>Y</kbd>  | Undo / Redo                      |
| <kbd>Ctrl</kbd> + <kbd>X</kbd>/<kbd>C</kbd>/<kbd>V</kbd>         | Cut / Copy / Paste               |
| <kbd>Ctrl</kbd> + <kbd>E</kbd>                                   | Open Command bar                 |
| <kbd>Ctrl</kbd> + <kbd>T</kbd>                                   | Add new tab                      |
| <kbd>Alt</kbd> + <kbd>,</kbd>/<kbd>.</kbd>                       | Previous / Next tab              |
| <kbd>Ctrl</kbd> + <kbd>R</kbd>                                   | Toggle the line number ruler     |

---
## 6. 🔐 SSH Configuration

This repository includes a custom SSH configuration to enhance security and usability. To use it, create a symbolic link:
```sh
ln -s $HOME/.dotfiles/ssh/config $HOME/.ssh/config
```
The configuration is modular:
-   **`config`**: The main SSH config file containing global settings.
-   **`local.sshconfig`**: An untracked file (`$HOME/.ssh/local.sshconfig`) that is included by the main config. Use this file for your host-specific settings.

**Why use a local SSH config?**
-   **No merge conflicts:** Keep your personal settings safe when pulling updates from this repository to your forked one.
-   **Privacy:** Keep sensitive host information out of your public repository.

The default configuration enables connection multiplexing (`ControlMaster`), which significantly speeds up subsequent connections to the same host by reusing the initial TCP connection.

### Default SSH Configuration

```ssh
Host *                                          #Applies these settings to all SSH connections.
    IgnoreUnknown UseKeychain                   #Ignores unknown options except `UseKeychain` (for compatibility).
    AddKeysToAgent yes                          #Automatically adds private keys to the ssh-agent for easier authentication.
    UseKeychain yes                             #On macOS, stores and loads SSH passphrases from the system keychain.
    IdentityFile ~/.ssh/id_rsa                  #Default private key used for authentication.
    Compression yes                             #Enables compression to speed up data transfer.
    ServerAliveInterval 60                      #Sends a keepalive message every 60 seconds to keep the connection active.
    ServerAliveCountMax 5                       #Disconnects after 5 missed keepalive responses.
    TCPKeepAlive yes                            #Ensures TCP-level keepalive packets are sent.
    ControlMaster auto                          #Enables SSH connection multiplexing, allowing multiple sessions over a single connection.
    ControlPath ~/.ssh/control-%r@%h:%p         #Path for the control socket used by multiplexing.
    ControlPersist 10m                          #Keeps the master connection open for 10 minutes after the last session closes.
    Include ~/.ssh/local.sshconfig              #Allows you to modularize your configuration by including additional settings from another file without changing this one.

```

---
## 7. 🐙 Git Configuration

This setup includes a default `.main.gitconfig`. To extend it without creating merge conflicts when pulling updates from this repository to your forked one, create your own local configuration at `$HOME/.config/git/local.gitconfig`.

**Why use a local Git config?**
-   **No merge conflicts:** Keep your personal settings safe when pulling updates from this repository to your forked one.
-   **Privacy:** Keep your name and email out of your public dotfiles.
-   **Multiple accounts:** Easily manage different Git identities (e.g., work vs. personal) using conditional includes based on the project directory.

To set up your Git configuration using `stow`:
```sh
mkdir -p $HOME/.config/git && cd $HOME/.dotfiles && stow --target=$HOME/.config/git git && cd
```
This links the git config files from this repo into `$HOME/.config/git`. You can then create `$HOME/.config/git/local.gitconfig` to define your user details and include other files conditionally, as shown in the original prompt's examples.

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

>**Note:**  
>I use the `$HOME/Developer` folder as my main projects directory because on macOS this folder has a custom "fancy" icon, making it easily recognizable in Finder. 
>On Ubuntu, the default folder is `$HOME/Develop`, but I usually rename it to `$HOME/Developer` to keep the same configuration and directory structure across both operating systems.

---
## 8. 🛠️ Customizing Your Zsh Quickstart Kit

The `zsh-quickstart-kit` is designed for easy customization without forking.
-   **Add custom settings** by creating files in `~/.zshrc.d` (loaded after plugins) or `~/.zshrc.pre-plugins.d` (loaded before plugins). Use a numbered naming scheme like `01-aliases.zsh` to control the load order.
-   **OS-specific settings** can be placed in directories like `~/.zshrc.Darwin.d` (for macOS) or `~/.zshrc.Linux.d`.
-   **Change the update interval** by setting `QUICKSTART_KIT_REFRESH_IN_DAYS` in a file within `~/.zshrc.d`.
-   **Completely replace the plugin list** by creating your own `~/.zsh-quickstart-local-plugins` file. An example file is included in the repository to use as a starting point.

---
## 9. 🐳 Bonus: Docker Development Environment

Test this (or your own) dotfiles configuration in a clean, reproducible Zsh environment using Docker.

1. 📋 **Prerequisites** Before proceeding with the installation, make sure to complete the steps listed in the **Prerequisites** section for your operating system.
- If you are using **macOS**, follow the instructions under **2.1 Prerequisites**.
- If you are using **Linux (Ubuntu)**, follow the instructions under **3.1 Prerequisites**.

2. 🛠️ **Build the Image** From your dotfiles repository root (`$HOME/.dotfiles`):
```sh
docker build -t my-zsh-dotfiles .
```

3. 🚀 **Run the Container**
```sh
docker run -e TERM -e COLORTERM -it --pid host --detach-keys="ctrl-^,ctrl-@" my-zsh-dotfiles
```This gives you a clean, isolated Zsh environment to safely test your configuration and tools.
