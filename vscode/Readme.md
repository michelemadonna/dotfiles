# ⚡️ VS Code Config and Extensions
This is my personal configuration for Visual Studio Code, including settings, keybindings, and a list of installed extensions.

- Theme : One Dark Pro Flat (via https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.material-theme)
- Icons : VSCode Icons (via https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- Font : 'FiraCode Nerd Font' (https://www.nerdfonts.com/font-downloads)

```json
{
    "workbench.iconTheme": "vscode-icons",
    "workbench.fontAliasing": "antialiased",
    "terminal.integrated.fontFamily": "'FiraCode Nerd Font'",
    "workbench.settings.applyToAllProfiles": [
        "editor.fontFamily"
    ],
    "editor.fontLigatures": true,
    "editor.linkedEditing": true,
    "editor.fontFamily": "'FiraCode Nerd Font'",
    "application.shellEnvironmentResolutionTimeout": 20,
    "workbench.colorTheme": "One Dark Pro Flat",
    "git.autofetch": true,
    "git.confirmSync": false,
    "gitlens.ai.model": "vscode",
    "gitlens.ai.vscode.model": "copilot:gpt-4.1",
    "github.copilot.nextEditSuggestions.enabled": true,
    "github.copilot.selectedCompletionModel": "",
    "github.copilot.enable": {
        "*": true,
        "plaintext": false,
        "markdown": true,
        "scminput": false
    },
    "github.copilot.chat.localeOverride": "en",
    "terminal.integrated.fontLigatures.enabled": true
}
```


To extract the list of installed extensions, you can use the following command:

```sh
 find ~/.vscode/extensions -maxdepth 1 -type d -exec bash -c '                                                                                             ✔  12:27:58 
  if [ -f "$1/package.json" ]; then
    jq -r ".publisher + \".\" + .name + \" — \" + .displayName + \" — \" + .description" "$1/package.json"
  fi
' _ {} \; | sort
```

- **batisteo.vscode-django** — Django — Beautiful syntax and scoped snippets for perfectionists with deadlines
- **christian-kohler.path-intellisense** — Path Intellisense — Visual Studio Code plugin that autocompletes filenames
- **dbaeumer.vscode-eslint** — ESLint — Integrates ESLint JavaScript into VS Code.
- **docker.docker** — Docker DX — Edit smarter, ship faster with an enhanced Docker-development experience
- **donjayamanne.python-environment-manager** — Python Environment Manager (deprecated) — View and manage Python environments & packages.
- **donjayamanne.python-extension-pack** — Python Extension Pack — Popular Visual Studio Code extensions for Python
- **eamodio.gitlens** — GitLens — Git supercharged — Supercharge Git within VS Code — Visualize code authorship at a glance via Git blame annotations  - and CodeLens, seamlessly navigate and explore Git repositories, gain valuable insights via rich visualizations and powerful comparison commands, - and so much more
- **ecmel.vscode-html-css** — HTML CSS Support — CSS Intellisense for HTML
- **EditorConfig.EditorConfig** — EditorConfig for VS Code — EditorConfig Support for Visual Studio Code
- **esbenp.prettier-vscode** — Prettier - Code formatter — Code formatter using prettier
- **formulahendry.auto-close-tag** — Auto Close Tag — Automatically add HTML/XML close tag, same as Visual Studio IDE or Sublime Text
- **formulahendry.auto-rename-tag** — Auto Rename Tag — Auto rename paired HTML/XML tag
- **GitHub.copilot** — GitHub Copilot — Your AI pair programmer
- **GitHub.copilot-chat** — GitHub Copilot Chat — AI chat features powered by Copilot
- **KevinRose.vsc-python-indent** — Python Indent — Correct Python indentation
- **ms-azuretools.vscode-containers** — Container Tools — Makes it easy to create, manage, and debug containerized applications.
- **ms-azuretools.vscode-docker** — Docker — Makes it easy to create, manage, and debug containerized applications.
- **ms-python.debugpy** — Python Debugger — Python Debugger extension using debugpy.
- **ms-python.python** — Python — Python language support with extension access points for IntelliSense (Pylance), Debugging (Python Debugger), linting, formatting, refactoring, unit tests, and more.
- **ms-python.vscode-pylance** — Pylance — A performant, feature-rich language server for Python in VS Code
- **ms-python.vscode-python-envs** — Python Environments — Provides a unified python environment experience
- **ms-toolsai.datawrangler** — Data Wrangler — Data viewing, cleaning and preparation for tabular datasets
- **ms-toolsai.jupyter** — Jupyter — Jupyter notebook support, interactive programming and computing that supports Intellisense, debugging and more.
- **ms-toolsai.jupyter-keymap** — Jupyter Keymap — Jupyter keymaps for notebooks
- **ms-toolsai.jupyter-renderers** — Jupyter Notebook Renderers — Renderers for Jupyter Notebooks (with plotly, vega, gif, png, svg, jpeg and other - such outputs)
- **ms-toolsai.vscode-jupyter-cell-tags** — Jupyter Cell Tags — Jupyter Cell Tags support for VS Code
- **ms-toolsai.vscode-jupyter-slideshow** — Jupyter Slide Show — Jupyter Slide Show support for VS Code
- **ms-vscode-remote.remote-containers** — %displayName% — %description%
- **ms-vscode.sublime-keybindings** — Sublime Text Keymap and Settings Importer — Import Sublime Text settings and keybindings into VS Code.
- **njpwerner.autodocstring** — autoDocstring - Python Docstring Generator — Generates python docstrings automatically
- **oderwat.indent-rainbow** — Indent Rainbow — Makes indentation easier to read
- **redhat.vscode-xml** — XML — XML Language Support by Red Hat
- **RobbOwen.synthwave-vscode** — SynthWave 84 — A Synthwave-inspired colour theme to satisfy your neon dreams
- **SonarSource.sonarlint-vscode** — SonarQube for IDE — Advanced linter to detect & fix coding issues locally in JS/TS, Python, Java, C#, C/C++, Go, PHP.  Use with SonarQube (Server, Cloud) for optimal team performance.
- **vscode-icons-team.vscode-icons** — vscode-icons — Icons for Visual Studio Code
- **wholroyd.jinja** — Jinja — Jinja template language support for Visual Studio Code
- **zhuangtongfa.material-theme** — One Dark Pro — Atom's iconic One Dark theme for Visual Studio Code
- **Zignd.html-css-class-completion** — IntelliSense for CSS class names in HTML — CSS class name completion for the HTML class attribute based on the definitions found in your workspace.