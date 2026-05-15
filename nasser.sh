#!/data/data/com.termux/files/usr/bin/bash

# Força o reconhecimento do teclado
exec < /dev/tty

# Definição de Cores
C="\033[1;36m"; R="\033[1;31m"; W="\033[1;37m"; Y="\033[1;33m"; G="\033[1;32m"; B="\033[1;34m"; N="\033[0m"

clear
# Cabeçalho Oficial NasserSS
echo -e "${C}NasserSS Android  ${R} FUCK BITHAHAHA${N}"
echo -e "${C} ███╗   ██╗ █████╗ ███████╗███████╗███████╗██████╗ ${N}"
echo -e "${C} ████╗  ██║██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗${N}"
echo -e "${C} ██╔██╗ ██║███████║███████╗███████╗█████╗  ██████╔╝${N}"
echo -e "${C} ██║╚██╗██║██╔══██║╚════██║╚════██║██╔══╝  ██╔══██╗${N}"
echo -e "${C} ██║ ╚████║██║  ██║███████║███████║███████╗██║  ██║${N}"
echo -e "${C} ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝${N}"
echo -e "${B}Coded By: NasserSS TERROR DE BUCETINHA${N}\n"

echo -e "${B}┌─ GUIA DE PAREAMENTO WI-FI${N}"
printf "${C}Porta de pareamento (ex: 38241): ${N}"; read -r PAIR_PORT
printf "${C}Código de 6 dígitos: ${N}"; read -r CODE
adb pair "127.0.0.1:$PAIR_PORT" "$CODE"

printf "\n${C}Porta de conexão principal (ex: 42115): ${N}"; read -r CONN_PORT
adb connect "127.0.0.1:$CONN_PORT"

# --- O PULO DO GATO ---
# Espera 2 segundos para a conexão estabilizar e detecta o ID real
sleep 2
DEVICE_ID=$(adb devices | grep "$CONN_PORT" | awk '{print $1}')

if [ -z "$DEVICE_ID" ]; then
    echo -e "${R}[!] Erro: Dispositivo não encontrado em 'adb devices'.${N}"
    exit 1
fi
# ----------------------

clear
echo -e "${C}NasserSS Android  ${R}Fucking Cheaters${N}\n"
echo -e "${B}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${B}║${W}                  MENU PRINCIPAL NASSER                   ${B}║${N}"
echo -e "${B}╚══════════════════════════════════════════════════════════╝${N}"
echo -e "${B}SISTEMA: ${G}● Conectado como $DEVICE_ID${N}\n"
echo -e "${G}[1] ${W}Escanear FreeFire Normal${N}"
echo -e "${G}[2] ${W}Escanear FreeFire Max${N}"
echo -e "${R}[5] ${W}Sair${N}\n"
printf "${C}┌─ Escolha uma opção: ${N}"; read -r CHOICE

PKG="com.dts.freefireth"
[ "$CHOICE" == "2" ] && PKG="com.dts.freefiremax"

echo -e "\n${Y}[!] Injetando Motor Nasser V3...${N}"
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1

# Usa o ID que o próprio ADB forneceu para evitar o erro "not found"
adb -s "$DEVICE_ID" push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb -s "$DEVICE_ID" shell chmod +x /data/local/tmp/nasser_v3_bin

clear
adb -s "$DEVICE_ID" shell "/data/local/tmp/nasser_v3_bin $PKG"

# Limpeza
rm nasser_v3_bin nasser.sh > /dev/null 2>&1
