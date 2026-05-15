#!/data/data/com.termux/files/usr/bin/bash

# Força o reconhecimento do teclado
exec < /dev/tty

# Definição de Cores
C="\033[1;36m"; R="\033[1;31m"; W="\033[1;37m"; Y="\033[1;33m"; G="\033[1;32m"; B="\033[1;34m"; N="\033[0m"

clear
# Cabeçalho Oficial NasserSS
echo -e "${C}NasserSS Android  ${R}Fuck You Xiter Lol${N}"
echo -e "${C} ███╗   ██╗ █████╗ ███████╗███████╗███████╗██████╗ ${N}"
echo -e "${C} ████╗  ██║██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗${N}"
echo -e "${C} ██╔██╗ ██║███████║███████╗███████╗█████╗  ██████╔╝${N}"
echo -e "${C} ██║╚██╗██║██╔══██║╚════██║╚════██║██╔══╝  ██╔══██╗${N}"
echo -e "${C} ██║ ╚████║██║  ██║███████║███████║███████╗██║  ██║${N}"
echo -e "${C} ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝${N}"
echo -e "${B}Coded By: NasserSS OLIVEIRA${N}\n"

echo -e "${B}┌─ PASSO 1: PAREAMENTO${N}"
echo -e "${W}Digite o IP e a Porta de pareamento (Ex: 192.168.1.8:40199)${N}"
printf "${C}IP:PORTA > ${N}"; read -r PAIR_FULL
printf "${C}CÓDIGO (6 DÍGITOS) > ${N}"; read -r CODE
adb pair "$PAIR_FULL" "$CODE"

echo -e "\n${B}┌─ PASSO 2: CONEXÃO${N}"
echo -e "${W}Digite o IP e a Porta de conexão (Ex: 192.168.1.8:37577)${N}"
printf "${C}IP:PORTA > ${N}"; read -r CONN_FULL
adb connect "$CONN_FULL"

# Aguarda o Android processar a entrada
sleep 2
DEVICE_ID=$(adb devices | grep -v "List" | awk '{print $1}' | head -n 1)

if [ -z "$DEVICE_ID" ]; then
    echo -e "${R}[!] Erro: Nenhum dispositivo conectado ao ADB.${N}"
    exit 1
fi

clear
echo -e "${C}NasserSS Android  ${R}Fuck BITHAHA${N}\n"
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

echo -e "\n${Y}[!] Baixando Motor Nasser V3...${N}"
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1

# Injeção usando o ID detectado
adb -s "$DEVICE_ID" push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb -s "$DEVICE_ID" shell chmod +x /data/local/tmp/nasser_v3_bin

clear
adb -s "$DEVICE_ID" shell "/data/local/tmp/nasser_v3_bin $PKG"

# Limpeza
rm nasser_v3_bin nasser.sh > /dev/null 2>&1
