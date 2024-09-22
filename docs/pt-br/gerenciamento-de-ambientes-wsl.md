# Gerenciamento de Ambientes WSL

 ## Índice

 - [Backup da Distribuição](#backup-da-distribuição)
 - [Desregistro (Remoção) da Distribuição](#desregistro-remocao-da-distribuicao)
 - [Importação para um Local Específico](#importacao-para-um-local-especifico)

 ## Backup da Distribuição

 Para criar um backup da sua distribuição Ubuntu existente:

 ```powershell
 wsl --export Ubuntu ubuntu_backup.tar
 ```

 - `Ubuntu` é o nome da sua distribuição (verifique com `wsl -l -v`).
 - `ubuntu_backup.tar` é o nome do arquivo de backup que será criado.

 ## Desregistro (Remoção) da Distribuição

 Para remover a distribuição do WSL (sem excluir o arquivo de backup):

 ```powershell
 wsl --unregister Ubuntu
 ```

 **Atenção:** Este comando remove a distribuição do WSL. Certifique-se de ter feito o backup antes.

 ## Importação para um Local Específico

 Para importar a distribuição para um diretório específico:

 ```powershell
 wsl --import UbuntuCustom D:WSLUbuntuCustom ubuntu_backup.tar --version 2
 ```

 - `UbuntuCustom` é o novo nome da distribuição.
 - `D:/WSL/UbuntuCustom` é o diretório onde a distribuição será instalada.
 - `ubuntu_backup.tar` é o arquivo de backup criado anteriormente.

 Agora, sua distribuição Ubuntu está instalada no local especificado.
