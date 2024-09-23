#!/bin/bash

# Função para instalar o VSCode
install_vscode() {
    echo "Instalando Visual Studio Code..."

    # Atualizar a lista de pacotes e instalar o VSCode
    sudo apt update && sudo apt install code -y
}

# Verificar se a variável já está no .bashrc
if ! grep -q "DONT_PROMPT_WSL_INSTALL=1" ~/.bashrc; then
  echo "Adicionando variável DONT_PROMPT_WSL_INSTALL ao .bashrc"
  echo 'export DONT_PROMPT_WSL_INSTALL=1' >> ~/.bashrc
  echo "Variável adicionada com sucesso!"
else
  echo "Variável DONT_PROMPT_WSL_INSTALL já está configurada."
fi

# Verificar se o alias já está no .bashrc
if ! grep -q "alias code" ~/.bashrc; then
  echo "Adicionando alias para o VSCode no .bashrc"
  echo 'alias code="code --no-sandbox --user-data-dir=~/.vscode"' >> ~/.bashrc
  echo "Alias adicionado com sucesso!"
else
  echo "Alias 'code' já está configurado."
fi

# Recarregar o .bashrc para aplicar as mudanças
echo "Recarregando o .bashrc"
source ~/.bashrc

# Executar a instalação do VSCode
install_vscode

echo "Script concluído. Visual Studio Code instalado e configurado. Agora você pode usar 'code .' sem prompts."
