#!/bin/bash

# Função para adicionar um repositório com chave GPG
add_repo() {
    echo "Adicionando chave GPG e repositório: $1"
    curl -fsSL "$2" | sudo tee /usr/share/keyrings/"$3" >/dev/null
    echo "deb [signed-by=/usr/share/keyrings/$3] $4 $5 $6" | sudo tee /etc/apt/sources.list.d/"$7".list >/dev/null
}

# Atualizando a lista de pacotes e removendo travas do apt caso existam
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo apt update

echo "Adicionando fontes de repositórios..."

# Node.js (Fonte)
add_repo "Node.js" "https://deb.nodesource.com/gpgkey/nodesource.gpg.key" "nodesource.gpg" "https://deb.nodesource.com/node_14.x" "focal" "main" "nodesource"

# Docker (Fonte)
add_repo "Docker" "https://download.docker.com/linux/ubuntu/gpg" "docker.gpg" "https://download.docker.com/linux/ubuntu" "focal" "stable" "docker"

# Yarn (Fonte)
add_repo "Yarn" "https://dl.yarnpkg.com/debian/pubkey.gpg" "yarn.gpg" "https://dl.yarnpkg.com/debian/" "stable" "main" "yarn"

# Visual Studio Code (Fonte)
add_repo "Visual Studio Code" "https://packages.microsoft.com/keys/microsoft.asc" "vscode.gpg" "https://packages.microsoft.com/repos/vscode" "stable" "main" "vscode"

# Google Chrome (Fonte)
add_repo "Google Chrome" "https://dl.google.com/linux/linux_signing_key.pub" "google.gpg" "http://dl.google.com/linux/chrome/deb/" "stable" "main" "google-chrome"

# Atualizar a lista de pacotes
echo "Atualizando lista de pacotes..."
sudo apt update

# Repositórios configurados com sucesso
echo "Repositórios configurados e lista de pacotes atualizada com sucesso!"
