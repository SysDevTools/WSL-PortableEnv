# Perguntas Frequentes (FAQ)

 ## Índice

 - [Posso usar o WSL no Windows 10?](#posso-usar-o-wsl-no-windows-10)
 - [Como atualizar minha distribuição Linux?](#como-atualizar-minha-distribuição-linux)
 - [Como remover uma distribuição do WSL?](#como-remover-uma-distribuição-do-wsl)
 - [Onde posso encontrar mais templates?](#onde-posso-encontrar-mais-templates)
 - [Como posso contribuir com o projeto?](#como-posso-contribuir-com-o-projeto)

 ### Posso usar o WSL no Windows 10?

 Sim, o WSL está disponível no Windows 10 versão 2004 ou superior.

 ### Como atualizar minha distribuição Linux?

 Dentro da distribuição, execute:

 ```bash
 sudo apt update && sudo apt upgrade -y
 ```

 ### Como remover uma distribuição do WSL?

 No **PowerShell**, execute:

 ```powershell
 wsl --unregister NomeDaDistro
 ```

 **Atenção:** Isso removerá todos os dados da distribuição.

 ### Onde posso encontrar mais templates?

 Visite nossa página na [Microsoft Store](https://www.microsoft.com/store/apps/developer/SysDevTools) para ver os templates disponíveis.

 ### Como posso contribuir com o projeto?

 Veja o [Guia de Contribuição](./como-contribuir.md) para mais informações.
