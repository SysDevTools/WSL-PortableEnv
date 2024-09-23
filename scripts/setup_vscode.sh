#!/bin/bash

# Função para instalar o VSCode
install_vscode() {
    echo "Instalando Visual Studio Code..."

    # Atualizar a lista de pacotes e instalar o VSCode
    sudo apt update && sudo apt install code -y
}

# Função para configurar o script para rodar o VSCode como root
setup_vscode_root() {
    echo "Configurando o script para rodar o VSCode como root..."

    # Criar o script no /usr/local/bin/vscode.sh
    sudo tee /usr/local/bin/vscode.sh > /dev/null <<EOF
#!/bin/bash
DONT_PROMPT_WSL_INSTALL=1 code --no-sandbox --user-data-dir="/root/.vscode-root" "\$@"
EOF

    # Tornar o script executável
    sudo chmod +x /usr/local/bin/vscode.sh

    # Adicionar um alias ao bashrc para facilitar a execução
    if ! grep -q "alias code='sudo vscode.sh'" ~/.bashrc; then
        echo "alias code='sudo vscode.sh'" >> ~/.bashrc
        echo "Alias adicionado ao .bashrc. Use 'source ~/.bashrc' para recarregar."
    fi

    # Aplicar as alterações no .bashrc imediatamente
    source ~/.bashrc
}

# Execução principal
install_vscode
setup_vscode_root

echo "Configuração completa. Use 'code .' para abrir o VSCode com o script configurado."
