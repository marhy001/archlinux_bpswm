#!/bin/bash

echo "⏳ Atualizando sistema..."
sudo pacman -Syu --noconfirm

echo "🔧 Instalando pacotes essenciais..."
sudo pacman -S --noconfirm xorg xorg-xinit bspwm sxhkd rofi polybar picom alacritty lxappearance feh neofetch htop unzip zip gvfs

echo "🔠 Instalando fontes e temas..."
sudo pacman -S --noconfirm ttf-nerd-fonts-symbols ttf-ubuntu-font-family papirus-icon-theme arc-gtk-theme

echo "🌐 Instalando Chromium..."
sudo pacman -S --noconfirm chromium

echo "📦 Instalando VirtualBox e dependências..."
sudo pacman -S --noconfirm virtualbox virtualbox-host-modules-arch linux-headers
sudo modprobe vboxdrv
sudo usermod -aG vboxusers $USER

echo "🎧 Configurando áudio com Pipewire..."
sudo pacman -S --noconfirm pipewire pipewire-pulse wireplumber pavucontrol

echo "🧪 Instalando ferramentas de Pentest..."
sudo pacman -S --noconfirm nmap wireshark-qt john hashcat hydra burpsuite metasploit

echo "🖥️ Criando .xinitrc para iniciar bspwm via ly..."
echo "exec bspwm" > ~/.xinitrc
chmod +x ~/.xinitrc

echo "🎨 Configurando terminal Alacritty..."
mkdir -p ~/.config/alacritty
cat > ~/.config/alacritty/alacritty.yml << EOF
font:
  normal:
    family: Ubuntu Mono
    size: 11
EOF

echo "🧱 Configurando BSPWM + SXHKD..."
mkdir -p ~/.config/bspwm ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc
chmod +x ~/.config/bspwm/bspwmrc

echo "🧩 Adicionando Polybar custom..."
mkdir -p ~/.config/polybar
cat > ~/.config/polybar/config.ini << EOF
[colors]
background = #222222
foreground = #eeeeee
primary = #5294e2
secondary = #444444

[bar/main]
width = 100%
height = 27
background = \${colors.background}
foreground = \${colors.foreground}
font-0 = Ubuntu Mono:style=Regular:size=11
modules-left = bspwm
modules-center = date
modules-right = volume network

[module/bspwm]
type = internal/bspwm
label-focused = %name%
label-focused-foreground = \${colors.primary}
label-unfocused = %name%
label-unfocused-foreground = \${colors.foreground}
label-urgent = %name%
label-urgent-foreground = #ff5555

[module/date]
type = internal/date
interval = 60
date = %a %d %b %H:%M
format-prefix =  
format-prefix-foreground = \${colors.primary}
format-foreground = \${colors.foreground}

[module/volume]
type = internal/volume
format-volume =  %percentage%%
format-muted = ﱝ muted
label-muted-foreground = #888888

[module/network]
type = internal/network
interface = wlan0
format-connected =  %essid%
format-disconnected = 睊 offline
format-disconnected-foreground = #888888
EOF

cat > ~/.config/polybar/launch.sh << 'EOF'
#!/bin/bash
killall -q polybar
polybar main &
EOF
chmod +x ~/.config/polybar/launch.sh

echo "🧠 Adicionando chamada da Polybar no bspwmrc..."
echo "~/.config/polybar/launch.sh &" >> ~/.config/bspwm/bspwmrc
echo "picom --experimental-backends &" >> ~/.config/bspwm/bspwmrc
echo "sxhkd &" >> ~/.config/bspwm/bspwmrc

echo "🎨 Adicionando tema escuro pro Rofi..."
mkdir -p ~/.config/rofi
cat > ~/.config/rofi/config.rasi << EOF
configuration {
  font: "Ubuntu Mono 11";
  show-icons: true;
  theme: "simple-dark";
}

@theme "simple-dark" {
  * {
    background-color: #1e1e1e;
    text-color:       #ffffff;
    border:           0;
    padding:          10px;
  }

  window {
    transparency: "real";
    width: 30%;
  }

  listview {
    lines: 10;
    columns: 1;
  }

  element {
    padding: 5px;
    background-color: transparent;
  }

  element selected {
    background-color: #444444;
    text-color: #ffffff;
  }

  entry {
    padding: 5px;
    background-color: #2a2a2a;
    text-color: #ffffff;
  }

  mainbox {
    background-color: #1e1e1e;
  }
}
EOF

echo "🔑 Atalho Super + D para abrir Rofi adicionado no sxhkdrc..."
echo "super + d" >> ~/.config/sxhkd/sxhkdrc
echo "    rofi -show drun" >> ~/.config/sxhkd/sxhkdrc

echo "🚪 Instalando e ativando LY (login manager)..."
sudo pacman -S --noconfirm ly
sudo systemctl enable ly

echo "✅ Tudo pronto! Reinicie o sistema para ver o LY iniciar e carregar o BSPWM!"

