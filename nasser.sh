#!/data/data/com.termux/files/usr/bin/bash

exec < /dev/tty
C="\033[1;36m"; R="\033[1;31m"; W="\033[1;37m"; Y="\033[1;33m"; G="\033[1;32m"; B="\033[1;34m"; N="\033[0m"

clear
echo -e "${Y}[*] Otimizando ambiente forense para seu dispositivo...${N}"
pkg update -y > /dev/null 2>&1
pkg install android-tools ncurses-utils curl wget -y > /dev/null 2>&1

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
printf "${C}IP:PORTA (ou so a porta) > ${N}"; read -r PAIR_INPUT
printf "${C}CÓDIGO (6 DÍGITOS) > ${N}"; read -r CODE
if [[ "$PAIR_INPUT" != *":"* ]]; then PAIR_FULL="127.0.0.1:$PAIR_INPUT"; else PAIR_FULL="$PAIR_INPUT"; fi
adb pair "$PAIR_FULL" "$CODE"

echo -e "\n${B}┌─ PASSO 2: CONEXÃO${N}"
printf "${C}IP:PORTA (ou so a porta) > ${N}"; read -r CONN_INPUT
if [[ "$CONN_INPUT" != *":"* ]]; then CONN_FULL="127.0.0.1:$CONN_INPUT"; else CONN_FULL="$CONN_INPUT"; fi
adb connect "$CONN_FULL"

sleep 2
DEVICE_ID=$(adb devices | grep -v "List" | grep -E '127.0.0.1|localhost|192.168' | awk '{print $1}' | head -n 1)

if [ -z "$DEVICE_ID" ]; then
    echo -e "${R}[!] Erro: Nenhum dispositivo detectado.${N}"
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
printf "\n${C}┌─ Escolha uma opção: ${N}"; read -r CHOICE

PKG="com.dts.freefireth"
[ "$CHOICE" == "2" ] && PKG="com.dts.freefiremax"

echo -e "\n${Y}[!] Sincronizando Motor e Bibliotecas...${N}"
curl -sL -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin

# --- AQUI ESTÁ O SEGREDO DO SUCESSO ---
# Acha a biblioteca no Termux do suspeito
LIB_LOCAL=$(find /data/data/com.termux/files/usr/lib/ -name "libc++_shared.so" | head -n 1)

# Envia o motor E a biblioteca para a mesma pasta
adb -s "$DEVICE_ID" push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
if [ ! -z "$LIB_LOCAL" ]; then
    adb -s "$DEVICE_ID" push "$LIB_LOCAL" /data/local/tmp/ > /dev/null 2>&1
fi

# Executa forçando o Android a olhar a biblioteca que acabamos de enviar
clear
adb -s "$DEVICE_ID" shell "chmod +x /data/local/tmp/nasser_v3_bin && LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/nasser_v3_bin $PKG"

# Limpeza total no celular do cara e no seu Termux
adb -s "$DEVICE_ID" shell "rm /data/local/tmp/nasser_v3_bin /data/local/tmp/libc++_shared.so" > /dev/null 2>&1
rm nasser_v3_bin nasser.sh > /dev/null 2>&1
