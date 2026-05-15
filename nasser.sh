#!/data/data/com.termux/files/usr/bin/bash

# Força o script a ler o teclado do usuário
exec < /dev/tty

clear
echo -e "\033[1;36m[!] SERVIDOR NASSER SS V3 ATIVO\033[0m"

# Instalação rápida (não gasta tempo se já tiver)
pkg install android-tools ncurses-utils -y > /dev/null 2>&1

echo -e "\n\033[1;33m[1/2] PAREAMENTO WI-FI\033[0m"
printf "\033[1;37mIP:Porta Pareamento: \033[0m"; read -r PAIR
printf "\033[1;37mCódigo 6 Dígitos: \033[0m"; read -r CODE

echo -e "\033[1;32m[*] Pareando dispositivo...\033[0m"
adb pair "$PAIR" "$CODE"

echo -e "\n\033[1;33m[2/2] CONEXÃO PRINCIPAL\033[0m"
printf "\033[1;37mIP:Porta Principal: \033[0m"; read -r CONNECT
echo -e "\033[1;32m[*] Conectando...\033[0m"
adb connect "$CONNECT"

echo -e "\n\033[1;36m[!] Baixando Core Engine...\033[0m"
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1

# Injeção e Execução
adb push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb shell chmod +x /data/local/tmp/nasser_v3_bin
clear
adb shell /data/local/tmp/nasser_v3_bin

# Limpeza
rm nasser_v3_bin
