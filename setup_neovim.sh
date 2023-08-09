cd /opt && sudo wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && sudo chmod +x /opt/nvim.appimage && sudo ./nvim.appimage --appimage-extract && sudo ln -s /opt/squashfs-root/usr/bin/nvim /usr/local/bin

cd /opt && sudo wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz && sudo tar xvzf ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz  && sudo ln -s /opt/ripgrep-13.0.0-x86_64-unknown-linux-musl/rg /usr/local/bin

git clone https://github.com/pyass/neovim_setup.git ~/.config/nvim

cd /tmp && git clone https://github.com/pyass/dev-tools.git && bash /tmp/dev-tools/setup.sh

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

pip3 install debugpy

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
