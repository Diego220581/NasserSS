#!/data/data/com.termux/files/usr/bin/bash

exec < /dev/tty
C="\033[1;36m"; R="\033[1;31m"; W="\033[1;37m"; Y="\033[1;33m"; G="\033[1;32m"; B="\033[1;34m"; N="\033[0m"

clear
echo -e "${Y}[*] Preparando Ambiente Forense... Aguarde.${N}"
# Instala o ADB no celular do suspeito para não dar "command not found"
pkg update -y > /dev/null 2>&1
pkg install android-tools ncurses-utils -y > /dev/null 2>&1

clear
echo -e "${C}NasserSS Android  ${R}Fucking Cheaters${N}"
echo -e "${C} ███╗   ██╗ █████╗ ███████╗███████╗███████╗██████╗ ${N}"
echo -e "${C} ████╗  ██║██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗${N}"
echo -e "${C} ██╔██╗ ██║███████║███████╗███████╗█████╗  ██████╔╝${N}"
echo -e "${C} ██║╚██╗██║██╔══██║╚════██║╚════██║██╔══╝  ██╔══██╗${N}"
echo -e "${C} ██║ ╚████║██║  ██║███████║███████║███████╗██║  ██║${N}"
echo -e "${C} ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝${N}"
echo -e "${B}Coded By: Nasser Oliveira${N}\n"

echo -e "${B}┌─ PASSO 1: PAREAMENTO${N}"
echo -e "${W}Pode digitar o IP completo ou apenas a Porta.${N}"
printf "${C}IP:PORTA (ou so a porta) > ${N}"; read -r PAIR_INPUT
printf "${C}CÓDIGO (6 DÍGITOS) > ${N}"; read -r CODE

# Inteligência artificial do script: Se não tiver ":" na digitação, ele põe o IP local
if [[ "$PAIR_INPUT" != *":"* ]]; then
    PAIR_FULL="127.0.0.1:$PAIR_INPUT"
else
    PAIR_FULL="$PAIR_INPUT"
fi
adb pair "$PAIR_FULL" "$CODE"

echo -e "\n${B}┌─ PASSO 2: CONEXÃO${N}"
printf "${C}IP:PORTA (ou so a porta) > ${N}"; read -r CONN_INPUT

if [[ "$CONN_INPUT" != *":"* ]]; then
    CONN_FULL="127.0.0.1:$CONN_INPUT"
else
    CONN_FULL="$CONN_INPUT"
fi
adb connect "$CONN_FULL"

sleep 2
DEVICE_ID=$(adb devices | grep -v "List" | grep -E '127.0.0.1|localhost|192.168' | awk '{print $1}' | head -n 1)

if [ -z "$DEVICE_ID" ]; then
    echo -e "${R}[!] Erro: Nenhum dispositivo conectado ao ADB.${N}"
    exit 1
fi

clear
echo -e "${C}NasserSS Android  ${R}Fucking Cheaters${N}\n"
echo -e "${B}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${B}║${W}                  MENU PRINCIPAL NASSER                   ${B}║${N}"
echo -e "${B}╚══════════════════════════════════════════════════════════╝${N}"
echo -e "${B}SISTEMA: ${G}● Conectado em $DEVICE_ID${N}\n"
echo -e "${G}[1] ${W}Escanear FreeFire Normal${N}"
echo -e "${G}[2] ${W}Escanear FreeFire Max${N}"
echo -e "${R}[5] ${W}Sair${N}\n"
printf "${C}┌─ Escolha uma opção: ${N}"; read -r CHOICE

PKG="com.dts.freefireth"
[ "$CHOICE" == "2" ] && PKG="com.dts.freefiremax"

echo -e "\n${Y}[!] Baixando Motor Nasser V5...${N}"
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1

adb -s "$DEVICE_ID" push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb -s "$DEVICE_ID" shell chmod +x /data/local/tmp/nasser_v3_bin

clear
adb -s "$DEVICE_ID" shell "/data/local/tmp/nasser_v3_bin $PKG"

rm nasser_v3_bin nasser.sh > /dev/null 2>&1
