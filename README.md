# 🚀 Script de Instalação Arch Linux + BSPWM

Este script automatiza a instalação de um ambiente leve e funcional com foco em desempenho, usando Arch Linux, BSPWM como gerenciador de janelas e ferramentas essenciais para navegação, multimídia e estudo de pentest.

## 🧰 O que será instalado:
- Ambiente gráfico: `xorg`, `bspwm`, `sxhkd`, `polybar`, `rofi`, `picom`, `alacritty`
- Login Manager: `ly`
- Navegador: `Chromium`
- Virtualização: `VirtualBox`
- Áudio: `Pipewire + Pavucontrol`
- Ferramentas de pentest: `nmap`, `wireshark`, `john`, `hashcat`, `hydra`, `burpsuite`, `metasploit`
- Aparência: `Papirus icons`, `Arc theme`, `Ubuntu Mono font`, `Nerd Fonts`

## 🔧 Instalação
1. Faça o boot no Arch Linux ISO
2. Execute `archinstall` e siga as instruções básicas (veja "Etapa 1" no final deste README)
3. Após o reboot e login, clone este repositório:

```bash
git clone git@github.com:SEU-USUARIO/SEU-REPOSITORIO.git
cd SEU-REPOSITORIO
chmod +x setup-completo.sh
./setup-completo.sh
