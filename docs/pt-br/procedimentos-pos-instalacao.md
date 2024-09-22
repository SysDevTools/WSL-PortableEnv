# Procedimentos Pós-Instalação

 ## Índice

 - [Atualização do Sistema](#atualização-do-sistema)
 - [Instalação de Pacotes Essenciais](#instalação-de-pacotes-essenciais)
 - [Configuração do Ambiente Gráfico](#configuração-do-ambiente-gráfico)
 - [Configuração do Teclado](#configuração-do-teclado)
 - [Próximos Passos](#próximos-passos)

 ## Atualização do Sistema

 Após a instalação, é importante atualizar os pacotes do sistema:

 ```bash
 sudo apt update && sudo apt upgrade -y
 ```

 ## Instalação de Pacotes Essenciais

 Instale pacotes básicos para desenvolvimento:

 ```bash
 sudo apt install build-essential git curl wget -y
 ```

 ## Configuração do Ambiente Gráfico

### Windows 11

 O **WSLg** já está integrado. Para testar, instale um aplicativo gráfico, como o Gedit:

 ```bash
 sudo apt install gedit -y
 gedit
 ```

### Windows 10

 Será necessário instalar um servidor X, como o **VcXsrv**.

 **Instalação do VcXsrv:**

 - Baixe e instale o [VcXsrv](https://sourceforge.net/projects/vcxsrv/).
 - Inicie o VcXsrv com as configurações padrão.

 **Configuração do DISPLAY no Ubuntu:**

 ```bash
 echo "export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0" >> ~/.bashrc
 source ~/.bashrc
 ```

 ## Configuração do Teclado

 Se necessário, configure o layout do teclado:

 ```bash
 sudo dpkg-reconfigure keyboard-configuration
 ```

 ## Próximos Passos

 - [Uso de Templates](./uso-de-templates.md)
 - [Backup e Restauração](./backup-restauracao.md)
