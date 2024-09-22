# Uso de Templates

 ## Índice

 - [Introdução aos Templates](#introdução-aos-templates)
 - [Templates Disponíveis](#templates-disponíveis)
 - [Importação de Templates](#importação-de-templates)
 - [Criando Seus Próprios Templates](#criando-seus-próprios-templates)
 - [Próximos Passos](#próximos-passos)

 ## Introdução aos Templates

 Os templates facilitam a configuração de ambientes pré-configurados, economizando tempo e garantindo consistência entre projetos.

 ## Templates Disponíveis

 - **WSL Portátil Env Ubuntu Basic**
  
   - **Descrição:** Template básico do Ubuntu com usuário `usuario` e senha `123`.
   - **Disponível na Microsoft Store:** [WSL Portátil Env Ubuntu Basic](https://www.microsoft.com/store/apps/developer/SysDevTools)

 ## Importação de Templates

 Para importar um template:

 1. **Baixe o template desejado.**
 2. **No PowerShell**, execute:

    ```powershell
    wsl --import NomeDaDistro CaminhoDaInstalação CaminhoDoTemplate --version 2
    ```

    - `NomeDaDistro`: Nome que você deseja dar à distribuição.
    - `CaminhoDaInstalação`: Diretório onde a distribuição será instalada.
    - `CaminhoDoTemplate`: Caminho para o arquivo do template baixado.

    **Exemplo:**

    ```powershell
    wsl --import UbuntuBasic D:WSLUbuntuBasic ubuntu_basic.tar --version 2
    ```

 ## Criando Seus Próprios Templates

 Para criar um template a partir de uma distribuição existente:

 ```powershell
 wsl --export NomeDaDistro NomeDoTemplate.tar
 ```

 - `NomeDaDistro`: Nome da distribuição existente.
 - `NomeDoTemplate.tar`: Nome do arquivo de template a ser criado.

 **Exemplo:**

 ```powershell
 wsl --export UbuntuCustom meu_template.tar
 ```

 ## Próximos Passos

 - [Backup e Restauração](./backup-restauracao.md)
 - [Como Contribuir](./como-contribuir.md)
