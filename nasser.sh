#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\033[1;36m[!] ACESSANDO SERVIDOR NASSER SS V3...\033[0m"

# Instalação silenciosa de dependências
pkg install android-tools ncurses-utils -y > /dev/null 2>&1

# Interface de Conexão Automática
echo -e "\n\033[1;33m[1/2] PAREAMENTO WI-FI\033[0m"
read -p "$(echo -e '\033[1;37mIP:Porta Pareamento (ex: 192.168.1.8:41234): \033[0m')" PAIR
read -p "$(echo -e '\033[1;37mCódigo de 6 Dígitos: \033[0m')" CODE
echo -e "\033[1;32m[*] Pareando...\033[0m"
adb pair "$PAIR" "$CODE"

echo -e "\n\033[1;33m[2/2] CONEXÃO PRINCIPAL\033[0m"
read -p "$(echo -e '\033[1;37mIP:Porta Principal (ex: 192.168.1.8:37555): \033[0m')" CONNECT
echo -e "\033[1;32m[*] Conectando...\033[0m"
adb connect "$CONNECT"

# Download do Binário e Biblioteca
echo -e "\n\033[1;36m[!] Baixando Core Engine e Injetando...\033[0m"
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1

# Injeção via ADB
adb push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb shell chmod +x /data/local/tmp/nasser_v3_bin

# Execução do Scanner
clear
adb shell /data/local/tmp/nasser_v3_bin

# Limpeza Pós-Execução
rm nasser_v3_bin > /dev/null 2>&1
