# Backup e Restauração

 ## Índice

 - [Realizando Backup](#realizando-backup)
 - [Restaurando de um Backup](#restaurando-de-um-backup)
 - [Dicas de Segurança](#dicas-de-segurança)
 - [Próximos Passos](#próximos-passos)

 ## Realizando Backup

 Para fazer backup de uma distribuição:

 ```powershell
 wsl --export NomeDaDistro CaminhoDoBackupbackup.tar
 ```

 **Exemplo:**

 ```powershell
 wsl --export Ubuntu D:Backupsubuntu_backup.tar
 ```

 ## Restaurando de um Backup

 Para restaurar uma distribuição a partir de um backup:

 ```powershell
 wsl --import NomeDaDistro CaminhoDaInstalação CaminhoDoBackupbackup.tar --version 2
 ```

 **Exemplo:**

 ```powershell
 wsl --import UbuntuRestaurado D:WSLUbuntuRestaurado D:Backupsubuntu_backup.tar --version 2
 ```

 ## Dicas de Segurança

 - **Armazene seus backups em um local seguro.**
 - **Faça backups regulares para evitar perda de dados.**

 ## Próximos Passos

 - [Uso de Templates](./uso-de-templates.md)
 - [FAQ](./faq.md)
