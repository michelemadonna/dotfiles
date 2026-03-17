FROM ubuntu:25.10

# Install essential packages and dependencies

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        zsh sudo curl wget nano stow grc ripgrep fd-find eza tree micro python3 python3-pip \
        bat command-not-found git-delta tmux htop git unzip fastfetch software-properties-common \
        default-jdk-headless nodejs make build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev libgdbm-dev libc6-dev libzstd-dev \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev gpg fastfetch && \
        ln -s /usr/bin/batcat /usr/bin/bat
RUN apt-get install -y coreutils-from-gnu coreutils-from-uutils- --allow-remove-essential
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a non-root user for demo
RUN useradd -ms /bin/zsh demo && echo "demo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER demo
WORKDIR /home/demo

# Clone dotfiles and zsh-quickstart-kit
RUN git clone https://github.com/unixorn/zsh-quickstart-kit.git .zqs && \
    git clone https://github.com/jandamm/zgenom.git .zgenom


ARG USE_OH_MY_POSH=false
ARG USE_MISE=false

# enable oh-my-posh
# Copy your dotfiles into the container
COPY --chown=demo:demo . /home/demo/.dotfiles

## Add SSH, Git, micro configurations

RUN mkdir -p /home/demo/.config && \
    mkdir -p /home/demo/.ssh && \
    mkdir -p /home/demo/.local/bin && \
    ln -sfn "/home/demo/.dotfiles/ssh/config" "/home/demo/.ssh/" && \
    ln -sfn "/home/demo/.dotfiles/micro" "/home/demo/.config/" && \
    ln -sfn "/home/demo/.dotfiles/git" "/home/demo/.config/"

# Stow zsh and zshrc.d configs
RUN cd /home/demo/.zqs && stow --target=/home/demo/ zsh && cd && \
    cd /home/demo/.dotfiles/zsh && stow --target=/home/demo/ zsh && cd && \
    cd /home/demo/.dotfiles/zsh && stow --target=/home/demo/.zshrc.d zshrc.d && cd

# Install oh-my-posh
RUN curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $HOME/.local/bin
#
# Install mise
RUN curl https://mise.run | sh

#
# Set Zsh as default shell
#SHELL ["/bin/zsh", "-c"]
##
#RUN  mkdir -p /home/demo/Developer/personal@github && \
#   mkdir -p /home/demo/Developer/work@github && \
#   cd /home/demo/Developer && \
#   git clone https://github.com/jenkins-docs/simple-java-maven-app.git work@github/simple-java-maven-app && \
#   git clone https://github.com/johnpapa/node-hello.git personal@github/simple-node-hello && \
#   git clone https://github.com/dbarnett/python-helloworld.git personal@github/python-helloworld && \
#   cp /home/demo/.dotfiles/git/examples/gitconfig.personal@github.example /home/demo/.config/git/gitconfig.personal@github && \
#   cp /home/demo/.dotfiles/git/examples/gitconfig.work@github.example /home/demo/.config/git/gitconfig.work@github && \
#   cp /home/demo/.dotfiles/git/examples/local.gitconfig.example /home/demo/.config/git/local.gitconfig
#
#RUN zsh -i -c 'cd $HOME && \
#    mise install java@17.0.2 && mise use -g java@system && \
#    mise install python@3.13.6 && mise use -g python@system && \
#    mise install node@22.14.0 && mise use -g node@system && \
#    cd /home/demo/Developer/personal@github/simple-node-hello && mise use node@22.14.0 && \
#    cd /home/demo/Developer/work@github/simple-java-maven-app && mise use java@17.0.2 && \
#    cd /home/demo/Developer/personal@github/python-helloworld && mise use python@3.13.6'

ENV ZQS_SHOW_FASTFETCH=true

# Start Zsh by default
CMD ["zsh"]

#build with 
#docker build \
#  --build-arg USE_OH_MY_POSH=true \
#  --build-arg USE_MISE=true \
#  --build-arg USE_FASTFETCH=true \
#  -t my-zsh-demo .

#Launch with
#docker run -e TERM -e COLORTERM -e ZQS_SHOW_FASTFETCH=true -it --pid host --detach-keys="ctrl-^,ctrl-@" my-zsh-demo