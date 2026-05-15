#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\033[1;36m[!] ACESSANDO SERVIDOR NASSER SS V3...\033[0m"
pkg install android-tools ncurses-utils -y > /dev/null 2>&1

# Interface de Conexão Inclusa
echo -e "\n\033[1;33m[1/2] PAREAMENTO WI-FI\033[0m"
printf "\033[1;37mIP:Porta Pareamento: \033[0m"; read PAIR
printf "\033[1;37mCódigo 6 Dígitos: \033[0m"; read CODE
adb pair $PAIR <<< "$CODE"

echo -e "\n\033[1;33m[2/2] CONEXÃO PRINCIPAL\033[0m"
printf "\033[1;37mIP:Porta Principal: \033[0m"; read CONNECT
adb connect $CONNECT

# Baixa e Injeta
echo -e "\n\033[1;32m[!] Injetando Core Engine no Kernel...\033[0m"
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1
adb push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb shell chmod +x /data/local/tmp/nasser_v3_bin

# Executa
adb shell /data/local/tmp/nasser_v3_bin

# Limpa tudo
rm nasser_v3_bin
