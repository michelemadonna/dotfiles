# ⚡️ Useful macOS  Applications 
This document lists various command-line tools and GUI applications that can enhance your macOS experience. You can install most of these using Homebrew, a popular package manager for macOS. To extract the list of installed applications with descriptions, you can use the following command:

```sh
# List installed formulas/applications with descriptions
brew leaves --installed-on-request | xargs brew desc --eval-all
# List installed cask/applications with descriptions
brew ls --casks | xargs brew desc --eval-all
# List installed Mac App Store applications
mas list

# Creates a Brewfile Dump
brew bundle dump --global --force --describe --file ~/Brewfile
# Restore from a Brewfile
brew bundle --file ~/Brewfile

```

## Command Line Tools (install on Mac with Homebrew - `brew install <tool>`)
- 🔵 **blueutil**: Get/set bluetooth power and discoverable state
- 📊 **btop**: Resource monitor. C++ version and continuation of bashtop and bpytop
- 💿 **cdrtools**: CD/DVD/Blu-ray premastering and recording software
- 📜 **ctags**: Reimplementation of ctags(1)
- 🐳 **dive**: Tool for exploring each layer in a docker image
- 🕵️ **dug**: Global DNS propagation checker that gives pretty output
- 🐶 **doggo**: Command-line DNS Client for Humans. Inspired by the simplicity and ease of use of the `dog` command.
- 🗂️ **duf**: Disk Usage/Free Utility - a better 'df' alternative
- 🦀 **dust**: More intuitive version of du in rust
- ⚡ **fastfetch**: Like neofetch, but much faster because written mostly in C
-  **gh**: Official GitHub CLI for managing repositories, issues, pull requests, and workflows from the terminal.
-  **git-delta**: Syntax-highlighting pager for `git diff` and `git show`, with GitHub-style formatting.
- 📈 **gping**: Ping, but with a graph
- 🎥 **handbrake**: Open-source video transcoder available for Linux, Mac, and Windows
- 🔍 **hexyl**: Command-line hex viewer
- 📊 **htop**: Improved top (interactive process viewer)
- 🌐 **httpie**: User-friendly cURL replacement (command-line HTTP client)
- 🐳 **k9s**: Kubernetes CLI To Manage Your Clusters In Style!
- 🐦 **kcat**: Generic command-line non-JVM Apache Kafka producer and consumer
- 🔄 **mackup**: Keep your Mac's application settings in sync
- 🛒 **mas**: Mac App Store command-line interface
- 🗂️ **midnight-commander**: Terminal-based visual file manager
- 🌙 **mist-cli**: Mac command-line tool that automatically downloads macOS Firmwares / Installers
- 🌐 **netcat**: Utility for managing network connections
- 🔍 **nmap**: Port scanning utility for large networks
- 🔔 **noti**: Trigger notifications when a process completes
- 📦 **pipx**: Execute binaries from Python packages in isolated environments
- ⚙️ **procs**: Modern replacement for ps written in Rust
- 🔊 **switchaudio-osx**: Change macOS audio source from the command-line
- 📚 **tlrc**: Official tldr client written in Rust
- 🏴‍☠️ **x265**: H.265/HEVC encoder
- 🔍 **television**: General purpose fuzzy finder TUI
- ⬆️ **topgrade**: Upgrade all the things (asdf-vm alternative)
- 🧹 **mac-cleanup-py**: Python cleanup script for macOS (before install use `brew tap mac-cleanup/mac-cleanup-py`)
- 🦙 **lazygit**: Simple terminal UI for git commands
- 🐳 **lazydocker**: Lazier way to manage everything docker
- 🐋 **reg**: Docker registry v2 command-line client

## GUI Applications (install on Mac with with Homebrew - `brew install --cask <app>`)
- 🎥 **5kplayer**: (5KPlayer) Play 4K/1080p/360-degree video, MP3/AAC/APE/FLAC music without quality loss
- 🖥️ **anydesk**: (AnyDesk) Allows connection to a computer remotely
- 🗑️ **appcleaner**: (FreeMacSoft AppCleaner) Application uninstaller
- 🎵 **background-music**: (Background Music) Audio utility
- 🖥️ **betterdisplay**: (BetterDisplay) Display management tool
- 🛡️ **blockblock**: (BlockBlock) Monitors common persistence locations
- 🦙 **bruno**: (Bruno) Open source IDE for exploring and testing APIs
- 📚 **calibre**: (calibre) E-books management software
- ☁️ **cyberduck**: (Cyberduck) Server and cloud storage browser
- 🗂️ **daisydisk**: (DaisyDisk) Disk space visualiser 
- 🐦 **darwindumper**: (DarwinDumper) App to dump system information to aid troubleshooting
- 🐦 **datagrip**: (DataGrip) Databases and SQL IDE **($$$)**
- 🐦 **dbeaver-community**: (DBeaver Community Edition) Universal database tool and SQL client
- 💬 **discord**: Voice and text chat software
- 🐦 **dockdoor**: (DockDoor) Window peeking utility app
- 🐦 **drawio**: (draw.io Desktop) Online diagram software
- 🌐 **firefox**: (Mozilla Firefox) Web browser
- 🔄 **fluor**: (Fluor) Change the behavior of the fn keys depending on the active application
- 🎨 **font-fira-code-nerd-font**: (FiraCode Nerd Font (Fira Code)) [no description]
- 🎨 **font-sauce-code-pro-nerd-font**: (SauceCodePro Nerd Font (Source Code Pro)) [no description]
- 📈 **geekbench**: (Geekbench) Tool to measure the computer system's performance
- 🕵️‍♂️ **ghidra**: (Ghidra) Software reverse engineering (SRE) suite of tools
- 🖥️ **ghostty**: (Ghostty) Modern GPU-accelerated terminal emulator (install the nightly build with `brew install --cask ghostty@tip`)
- 🐙 **gitkraken**: (GitKraken) Git client focusing on productivity **(free for public repo, else $$$)**
- 🧮 **hex-fiend**: (Hex Fiend) Hex editor focusing on speed
- 🎥 **iina**: (IINA) Free and open-source media player
- 🦙 **intellij-idea**: (IntelliJ IDEA Ultimate) Java IDE by JetBrains. **($$$) Alternately install the Community Edition with `brew install --cask intellij-idea-ce`**
- 🖥️ **iterm2**: (iTerm2) Terminal emulator as alternative to Apple's Terminal app
- 🧊 **jordanbaird-ice**: (Ice) Menu bar manager
- 📦 **keka**: (Keka) File archiver
- 🧩 **kextviewr**: (KextViewr) Display all currently loaded kexts
- ⌨️ **keuclu**: (KeuClu) Find shortcuts for any installed application
- 🕵️ **knockknock**: (KnockKnock) Tool to show what is persistently installed on the computer
- 🛰️ **lens**: (Lens) Kubernetes IDE
- 🛡️ **little-snitch**: (Little Snitch) Host-based application firewall **($$$)**
- 🖱️ **logi-options**: (Logitech Options) Software for Logitech devices
- 🦠 **malwarebytes**: (Malwarebytes for Mac) Scan and remove malware, spyware, and viruses
- 🗂️ **marta**: (Marta File Manager) Extensible two-pane file manager
- 🌐 **microsoft-edge**: (Microsoft Edge) Multi-platform web browser
- 💬 **microsoft-teams**: (Microsoft Teams) Meet, chat, call, and collaborate in just one place
- 🌙 **mist**: (Mist) Mac command-line tool that automatically downloads macOS Firmwares / Installers (GUI version install with `--cask`)
- 🕵️ **mitmproxy**: (mitmproxy) Intercept, modify, replay, save HTTP/S traffic
- 🖱️ **mos**: (Mos) Smooths scrolling and set mouse scroll directions independently
- ⬇️ **motrix**: (Motrix) Open-source download manager
- 📶 **netspot**: (NetSpot) WiFi site survey software and WiFi scanner
- 🎮 **nvidia-geforce-now**: (NVIDIA GeForce NOW) Cloud gaming platform
- 🛠️ **onyx**: (OnyX) Verify system files structure, run miscellaneous maintenance and more
- 🐙 **openshift-client**: (Openshift Client) Red Hat OpenShift Container Platform command-line client
- ☕ **openjdk@21**: (OpenJDK 21) JDK from OpenJDK
- 🗃️ **p4v**: (Perforce Helix Visual Client, P4Merge, P4V) Visual client for Helix Core
- 🧹 **pearcleaner**: (PearCleaner) Utility to uninstall apps and remove leftover files from old/uninstalled apps
- 🎬 **plex**: (Plex) Home media player
- 🐍 **pycharm**: (PyCharm, PyCharm Professional) IDE for professional Python development. **($$$) Alternately install the Community Edition with `brew install --cask pycharm-ce`**
- 📦 **rar**: (RAR Archiver) Archive manager for data compression and backups
- 📄 **skim**: (Skim) PDF reader and note-taking application
- 🦥 **sloth**: (Sloth) Displays all open files and sockets in use by all running processes
- 🎵 **spotify**: (Spotify) Music streaming service
- 🎮 **steam**: (Steam) Video game digital distribution service
- 📺 **stremio**: (Stremio) Open-source media center
- 📝 **sublime-text**: (Sublime Text) Text editor for code, markup and prose
- 🕵️‍♂️ **suspicious-package**: (Suspicious Package) Application for inspecting installer packages
- 🔒 **tunnelblick**: (Tunnelblick) Free and open-source OpenVPN client
- 🖊️ **visual-studio-code**: (Microsoft Visual Studio Code, VS Code) Open-source code editor
- 🤝 **zed**: (Zed) Multiplayer code editor
- 🧽 **tencent-lemon**: (Tencent Lemon) Tencent Lemon Cleaner
- 🧠 **xmind**: (XMind) Mind mapping and brainstorming tool

## Apple Store Apps
- 🚫 **AdBlock Pro** Block ads in Safari **($$$)**
- 💤 **Amphetamine** Keep your Mac awake
- 🔐 **Bitwarden** Password manager
- ⚙️ **Blackmagic Disk Speed Test** Measure disk performance
- 🛠️ **Developer** Apple tools for developers
- 🐦 **Discovery** Browse local Bonjour services
- 🐢 **DoubleMemory** Your second brain
- 🗒️ **Evernote** Note-taking and organization
- 📝 **Evernote Web Clipper** Clip web pages to Evernote
- 🎶 **GarageBand** Music creation software by Apple
- 🎬 **iMovie** Video editing software by Apple
- 🎤 **Keynote** Presentation software by Apple
- 🖥️ **Mactracker** Mac hardware and software information
- 📊 **Microsoft Excel** MS Office Spreadsheet software **($$$)**
- 📝 **Microsoft OneNote** MS Office Note-taking and organization **($$$)**
- 📧 **Microsoft Outlook** MS Office Email client **($$$)**
- 📊 **Microsoft PowerPoint** MS Office Presentation software **($$$)**
- 📝 **Microsoft Word** MS Office Word processing software **($$$)**
- 📂 **New File Menu Lite** Quick access to create new files
- 🛡️ **NordVPN** VPN service **($$$)**
- 📊 **Numbers** Spreadsheet software by Apple
- 📝 **Pages** Word processing software by Apple
- 💬 **Telegram** Messaging app
- 📁 **TeraCopy** File transfer utility
- 📦 **The Unarchiver** Extract various archive formats
- 🪟 **Windows App** Windows Remote Desktop by Microsoft
- 🛠️ **Xcode** Integrated development environment by Apple

