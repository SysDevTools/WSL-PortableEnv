#!/bin/bash

# Função para baixar chaves e colocá-las no diretório correto
add_gpg_key() {
    local url=$1
    local keyring=$2

    curl -fsSL "$url" | gpg --dearmor | sudo tee "$keyring" > /dev/null
}

# Adicionar chave GPG do Node.js
add_gpg_key "https://deb.nodesource.com/gpgkey/nodesource.gpg.key" "/usr/share/keyrings/nodesource.gpg"

# Adicionar chave GPG do Docker
add_gpg_key "https://download.docker.com/linux/ubuntu/gpg" "/usr/share/keyrings/docker.gpg"

# Adicionar chave GPG do Yarn
add_gpg_key "https://dl.yarnpkg.com/debian/pubkey.gpg" "/usr/share/keyrings/yarn.gpg"

# Adicionar chave GPG do Visual Studio Code
add_gpg_key "https://packages.microsoft.com/keys/microsoft.asc" "/usr/share/keyrings/vscode.gpg"

# Adicionar chave GPG do Google Chrome
add_gpg_key "https://dl.google.com/linux/linux_signing_key.pub" "/usr/share/keyrings/google.gpg"

# Adicionar repositórios
echo "Adicionando fontes de repositórios..."

# Node.js (usando o codinome 'noble')
cat <<EOF | sudo tee /etc/apt/sources.list.d/nodesource.sources
Types: deb
URIs: https://deb.nodesource.com/node_14.x
Suites: noble
Components: main
Signed-By: /usr/share/keyrings/nodesource.gpg
EOF

# Docker (usando o codinome 'noble')
cat <<EOF | sudo tee /etc/apt/sources.list.d/docker.sources
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: noble
Components: stable
Signed-By: /usr/share/keyrings/docker.gpg
EOF

# Yarn
cat <<EOF | sudo tee /etc/apt/sources.list.d/yarn.sources
Types: deb
URIs: https://dl.yarnpkg.com/debian/
Suites: stable
Components: main
Signed-By: /usr/share/keyrings/yarn.gpg
EOF

# Visual Studio Code
cat <<EOF | sudo tee /etc/apt/sources.list.d/vscode.sources
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Signed-By: /usr/share/keyrings/vscode.gpg
EOF

# Google Chrome
cat <<EOF | sudo tee /etc/apt/sources.list.d/google-chrome.sources
Types: deb
URIs: http://dl.google.com/linux/chrome/deb/
Suites: stable
Components: main
Signed-By: /usr/share/keyrings/google.gpg
EOF

# Atualizar lista de pacotes
echo "Atualizando lista de pacotes..."
sudo apt update

echo "Repositórios configurados e lista de pacotes atualizada com sucesso!"
