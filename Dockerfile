FROM ubuntu:24.10

# Install essential packages and dependencies

RUN apt update -y && apt install -y gpg wget curl \
    && install -dm 755 /etc/apt/keyrings \
    && wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null \
    && echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | tee /etc/apt/sources.list.d/mise.list \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        zsh sudo curl wget nano stow grc ripgrep fd-find eza tree micro python3 python3-pip \
        bat command-not-found git-delta tmux htop git unzip fastfetch software-properties-common \
        default-jdk-headless nodejs make build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev libgdbm-dev libc6-dev libzstd-dev \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev mise && \
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

## Add fastfetch configuration
RUN mkdir -p /home/demo/.config/fastfetch && \
    cd /home/demo/.dotfiles && \
    stow --target=/home/demo/.config/fastfetch fastfetch

# Set Zsh as default shell
SHELL ["/bin/zsh", "-c"]
RUN /bin/zsh -i && \
    mise use usage && \
    mise install java@17.0.2 && mise use -g java@system && \
    mise install python@3.13.6 && mise use -g python@system && \
    mise install node@22.14.0 && mise use -g node@system

RUN mkdir -p /home/demo/Developer/personal@github && \
    mkdir -p /home/demo/Developer/work@github && \
    cd /home/demo/Developer && \
    git clone https://github.com/jenkins-docs/simple-java-maven-app.git work@github/simple-java-maven-app && \
    git clone https://github.com/johnpapa/node-hello.git personal@github/simple-node-hello && \
    git clone https://github.com/dbarnett/python-helloworld.git personal@github/python-helloworld && \
    cp /home/demo/.dotfiles/git/examples/gitconfig.personal@github.example /home/demo/.config/git/gitconfig.personal@github && \
    cp /home/demo/.dotfiles/git/examples/gitconfig.work@github.example /home/demo/.config/git/gitconfig.work@github && \
    cp /home/demo/.dotfiles/git/examples/local.gitconfig.example /home/demo/.config/git/local.gitconfig && \
    cd /home/demo/Developer/personal@github/simple-node-hello && mise use node@22.14.0 && \
    cd /home/demo/Developer/work@github/simple-java-maven-app && mise use java@17.0.2 && \
    cd /home/demo/Developer/personal@github/python-helloworld && mise use python@3.13.6






# Start Zsh by default
CMD ["zsh"]

#Launch with
#docker run -e TERM -e COLORTERM -it --pid host --detach-keys="ctrl-^,ctrl-@" my-zsh-demo