FROM ubuntu:24.10

# Install essential packages and dependencies

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        zsh sudo curl wget nano stow grc ripgrep fd-find eza tree micro python3 python3-pip \
        bat command-not-found git-delta tmux htop git unzip fastfetch software-properties-common \
        default-jdk-headless nodejs make build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev libgdbm-dev libc6-dev libzstd-dev \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev  && \
    ln -s /usr/bin/batcat /usr/bin/bat && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


    


# Create a non-root user for demo
RUN useradd -ms /bin/zsh demo && echo "demo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


USER demo
WORKDIR /home/demo

# Clone dotfiles and zsh-quickstart-kit
RUN git clone https://github.com/unixorn/zsh-quickstart-kit.git .zqs && \
    git clone https://github.com/jandamm/zgenom.git .zgenom

# Copy your dotfiles into the container
COPY --chown=demo:demo . /home/demo/.dotfiles

# Stow zsh and zshrc.d configs
RUN cd /home/demo/.zqs && stow --target=/home/demo/ zsh && cd && \
    cd /home/demo/.dotfiles/zsh && stow --target=/home/demo/ zsh && cd && \
    cd /home/demo/.dotfiles/zsh && stow --target=/home/demo/.zshrc.d zshrc.d && cd

# Install asdf (system-wide, but owned by demo user)
RUN mkdir -p /home/demo/.asdf/bin && \
    cd /home/demo/.asdf/bin && \
    wget https://github.com/asdf-vm/asdf/releases/download/v0.18.0/asdf-v0.18.0-linux-amd64.tar.gz && \
    tar zxvf asdf-v0.18.0-linux-amd64.tar.gz && \
    rm asdf-v0.18.0-linux-amd64.tar.gz && \
    chown -R demo:demo /home/demo/.asdf

## FZF shell integration (completion and key-bindings)
RUN mkdir -p /home/demo/.fzf/shell && \
    ln -s /home/demo/.dotfiles/fzf-linux/completion.zsh /home/demo/.fzf/shell/completion.zsh && \
    ln -s /home/demo/.dotfiles/fzf-linux/key-bindings.zsh /home/demo/.fzf/shell/key-bindings.zsh

## Add SSH configuration
RUN mkdir -p /home/demo/.ssh && \
    ln -s /home/demo/.dotfiles/ssh/config /home/demo/.ssh/config

## Add Git configuration
RUN mkdir -p /home/demo/.config/git && \
    cd /home/demo/.dotfiles && \
    stow --target=/home/demo/.config/git git

## Add Micro configuration
RUN mkdir -p /home/demo/.config/micro && \
    cd /home/demo/.dotfiles && \
    stow --target=/home/demo/.config/micro micro

# Set Zsh as default shell
SHELL ["/bin/zsh", "-c"]

RUN /home/demo/.asdf/bin/asdf plugin add java && \
    /home/demo/.asdf/bin/asdf install java openjdk-17 && \
    /home/demo/.asdf/bin/asdf set -u java system

RUN /home/demo/.asdf/bin/asdf plugin add nodejs && \
    /home/demo/.asdf/bin/asdf install nodejs 22.14.0 && \
    /home/demo/.asdf/bin/asdf set -u nodejs system

RUN /home/demo/.asdf/bin/asdf plugin add python && \
    /home/demo/.asdf/bin/asdf install python 3.13.6 && \
    /home/demo/.asdf/bin/asdf set -u python system && \
    sed -E 's/("?)python([^3]|$)/\1python3\2/g' -i /home/demo/.asdf/shims/python && \
    sed -E 's/("?)pip([^3]|$)/\1pip3\2/g' -i /home/demo/.asdf/shims/pip

RUN mkdir -p /home/demo/Developer/personal@github && \
    mkdir -p /home/demo/Developer/work@github && \
    cd /home/demo/Developer && \
    git clone https://github.com/jenkins-docs/simple-java-maven-app.git work@github/simple-java-maven-app && \
    git clone https://github.com/johnpapa/node-hello.git personal@github/simple-node-hello && \
    cp /home/demo/.dotfiles/git/examples/gitconfig.personal@github.example /home/demo/.config/git/gitconfig.personal@github && \
    cp /home/demo/.dotfiles/git/examples/gitconfig.work@github.example /home/demo/.config/git/gitconfig.work@github && \
    cp /home/demo/.dotfiles/git/examples/local.gitconfig.example /home/demo/.config/git/local.gitconfig && \
    cd /home/demo/Developer/personal@github/simple-node-hello && /home/demo/.asdf/bin/asdf set nodejs 22.14.0 && \
    cd /home/demo/Developer/work@github/simple-java-maven-app && /home/demo/.asdf/bin/asdf set java openjdk-17



# Set Zsh as default shell
SHELL ["/bin/zsh", "-c"]



# Start Zsh by default
CMD ["zsh"]

#Launch with
#docker run -e TERM -e COLORTERM -it --pid host --detach-keys="ctrl-^,ctrl-@" my-zsh-demo

