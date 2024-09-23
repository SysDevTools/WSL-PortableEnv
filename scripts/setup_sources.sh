#!/bin/bash

# Baixar o arquivo sources.list atualizado
echo "Baixando o arquivo sources.list atualizado..."
curl -O https://raw.githubusercontent.com/SysDevTools/WSL-PortableEnv/main/configs/sources.list

# Verificar se o arquivo foi baixado com sucesso
if [ ! -f "sources.list" ]; then
    echo "Erro: Não foi possível baixar o arquivo sources.list."
    exit 1
fi

# Fazer backup do sources.list original
echo "Fazendo backup do arquivo sources.list original..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Substituir o arquivo sources.list
echo "Substituindo o arquivo sources.list pelo novo..."
sudo cp sources.list /etc/apt/sources.list

# Adicionar chaves GPG necessárias com verificações

# Node.js
echo "Adicionando chave GPG do Node.js..."
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_14.x $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# Yarn
echo "Adicionando chave GPG do Yarn..."
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --dearmor -o /usr/share/keyrings/yarn.gpg
echo "deb [signed-by=/usr/share/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Docker
echo "Adicionando chave GPG do Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

# Visual Studio Code
echo "Adicionando chave GPG do Visual Studio Code..."
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Google Chrome
echo "Adicionando chave GPG do Google Chrome..."
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google.gpg
echo "deb [signed-by=/usr/share/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Git (via PPA)
echo "Adicionando PPA do Git..."
sudo add-apt-repository ppa:git-core/ppa -y

# PostgreSQL
echo "Adicionando chave GPG do PostgreSQL..."
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /usr/share/keyrings/postgresql.gpg
echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list

# Atualizar a lista de pacotes
echo "Atualizando a lista de pacotes..."
sudo apt update || { echo "Erro: Falha ao atualizar a lista de pacotes."; exit 1; }

echo "Configuração concluída com sucesso!"
