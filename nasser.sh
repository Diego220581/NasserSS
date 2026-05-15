#!/data/data/com.termux/files/usr/bin/bash
exec < /dev/tty
clear
C="\033[1;36m"; R="\033[1;31m"; W="\033[1;37m"; Y="\033[1;33m"; G="\033[1;32m"; B="\033[1;34m"; N="\033[0m"

# Cabeçalho Estilo KellerSS
echo -e "${C}KellerSS Android  ${R}Fucking Cheaters${N}"
echo -e "${C} ███╗   ██╗ █████╗ ███████╗███████╗███████╗██████╗ ${N}"
echo -e "${C} ████╗  ██║██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗${N}"
echo -e "${C} ██╔██╗ ██║███████║███████╗███████╗█████╗  ██████╔╝${N}"
echo -e "${C} ██║╚██╗██║██╔══██║╚════██║╚════██║██╔══╝  ██╔══██╗${N}"
echo -e "${C} ██║ ╚████║██║  ██║███████║███████║███████╗██║  ██║${N}"
echo -e "${C} ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝${N}\n"

echo -e "${B}┌─ GUIA DE PAREAMENTO WI-FI${N}"
echo -e "${W}1. Ative a Depuração Wi-Fi nas Opções de Desenvolvedor${N}"
echo -e "${W}2. Clique em 'Parear com código'${N}"

printf "${C}Porta de pareamento (ex: 38241): ${N}"; read -r PAIR_PORT
printf "${C}Código (6 dígitos): ${N}"; read -r CODE
adb pair "127.0.0.1:$PAIR_PORT" "$CODE"

printf "\n${C}Porta de conexão principal (ex: 42115): ${N}"; read -r CONN_PORT
adb connect "127.0.0.1:$CONN_PORT"

clear
echo -e "${C}KellerSS Android  ${R}Fucking Cheaters${N}\n"
echo -e "${B}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${B}║${W}                  MENU PRINCIPAL                          ${B}║${N}"
echo -e "${B}╚══════════════════════════════════════════════════════════╝${N}"
echo -e "${G}[1] ${W}Escanear FreeFire Normal${N}"
echo -e "${G}[2] ${W}Escanear FreeFire Max${N}"
printf "\n${C}Escolha uma opção: ${N}"; read -r CHOICE

PKG="com.dts.freefireth"
[ "$CHOICE" == "2" ] && PKG="com.dts.freefiremax"

echo -e "\n${Y}[!] Baixando Motor Forense e Injetando...${N}"
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1
adb push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb shell chmod +x /data/local/tmp/nasser_v3_bin

# Executa o Motor C++ com o layout de 8 minutos
clear
adb shell "/data/local/tmp/nasser_v3_bin $PKG"

# Limpeza
rm nasser_v3_bin nasser.sh > /dev/null 2>&1
