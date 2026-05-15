#!/data/data/com.termux/files/usr/bin/bash

# Força o reconhecimento do teclado
exec < /dev/tty

# Definição de Cores
C="\033[1;36m"; R="\033[1;31m"; W="\033[1;37m"; Y="\033[1;33m"; G="\033[1;32m"; B="\033[1;34m"; N="\033[0m"

clear
# Cabeçalho Oficial NasserSS
echo -e "${C}NasserSS Android  ${R}Fucking Cheaters${N}"
echo -e "${W}Auditoria Forense de Dispositivos${N}\n"
echo -e "${C} ███╗   ██╗ █████╗ ███████╗███████╗███████╗██████╗ ${N}"
echo -e "${C} ████╗  ██║██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗${N}"
echo -e "${C} ██╔██╗ ██║███████║███████╗███████╗█████╗  ██████╔╝${N}"
echo -e "${C} ██║╚██╗██║██╔══██║╚════██║╚════██║██╔══╝  ██╔══██╗${N}"
echo -e "${C} ██║ ╚████║██║  ██║███████║███████║███████╗██║  ██║${N}"
echo -e "${C} ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝${N}"
echo -e "${B}Coded By: Nasser Oliveira${N}\n"

echo -e "${B}┌─ GUIA DE PAREAMENTO WI-FI${N}"
echo -e "${W}1. Ative a Depuração Wi-Fi nas Opções de Desenvolvedor${N}"
echo -e "${W}2. Clique em 'Parear com código de pareamento'${N}"

printf "\n${C}Porta de pareamento (ex: 38241): ${N}"; read -r PAIR_PORT
printf "${C}Código de 6 dígitos: ${N}"; read -r CODE
echo -e "${G}[*] Pareando dispositivo local...${N}"
adb pair "127.0.0.1:$PAIR_PORT" "$CODE"

printf "\n${C}Porta de conexão principal (ex: 42115): ${N}"; read -r CONN_PORT
echo -e "${G}[*] Estabelecendo conexão ADB...${N}"
adb connect "127.0.0.1:$CONN_PORT"

clear
# Menu Principal NasserSS
echo -e "${C}NasserSS Android  ${R}Fucking Cheaters${N}\n"
echo -e "${B}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${B}║${W}                  MENU PRINCIPAL NASSER                   ${B}║${N}"
echo -e "${B}╚══════════════════════════════════════════════════════════╝${N}"
echo -e "${B}SISTEMA: ${G}● Conectado em 127.0.0.1:$CONN_PORT${N}\n"
echo -e "${G}[1] ${W}Escanear FreeFire Normal${N}"
echo -e "${G}[2] ${W}Escanear FreeFire Max${N}"
echo -e "${G}[3] ${W}Salvar Dump de Memória${N}"
echo -e "${R}[5] ${W}Sair${N}\n"
printf "${C}┌─ Escolha uma opção: ${N}"; read -r CHOICE

PKG="com.dts.freefireth"
[ "$CHOICE" == "2" ] && PKG="com.dts.freefiremax"

if [ "$CHOICE" == "5" ]; then
    echo -e "${Y}Saindo...${N}"
    exit 1
fi

echo -e "\n${Y}[!] Acessando Servidor e Injetando Motor...${N}"
# Baixa o binário do seu GitHub
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1

# Injeção direcionada para evitar erro de "more than one device"
adb -s "127.0.0.1:$CONN_PORT" push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb -s "127.0.0.1:$CONN_PORT" shell chmod +x /data/local/tmp/nasser_v3_bin

# Executa o Motor C++ Brutal (8 minutos de scan)
clear
adb -s "127.0.0.1:$CONN_PORT" shell "/data/local/tmp/nasser_v3_bin $PKG"

# Limpeza automática de rastros
rm nasser_v3_bin nasser.sh > /dev/null 2>&1
