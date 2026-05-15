#!/data/data/com.termux/files/usr/bin/bash
clear
echo -e "\033[1;36m[!] ACESSANDO SERVIDOR NASSER SS V3...\033[0m"

# Instalação rápida de dependências se não houver
pkg install android-tools ncurses-utils -y > /dev/null 2>&1

# Baixa o binário e a biblioteca necessária do seu repositório
curl -L -o nasser_v3_bin https://github.com/Diego220581/NasserSS/raw/main/nasser_v3_bin > /dev/null 2>&1
curl -L -o libc++_shared.so https://github.com/Diego220581/NasserSS/raw/main/libc++_shared.so > /dev/null 2>&1 2>/dev/null || cp /data/data/com.termux/files/usr/lib/libc++_shared.so .

# Injeção e Execução via ADB
echo -e "\033[1;33m[!] Estabelecendo ponte ADB nativa...\033[0m"
adb push libc++_shared.so /data/local/tmp/ > /dev/null 2>&1
adb push nasser_v3_bin /data/local/tmp/ > /dev/null 2>&1
adb shell chmod +x /data/local/tmp/nasser_v3_bin

# Execução do Motor C++
adb shell "LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/nasser_v3_bin"

# Limpeza automática
rm nasser_v3_bin libc++_shared.so nasser.sh > /dev/null 2>&1
