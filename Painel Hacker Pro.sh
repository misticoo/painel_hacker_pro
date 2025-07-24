#!/bin/bash

# Cores e efeitos
red='\e[1;91m'
green='\e[1;92m'
yellow='\e[1;93m'
blue='\e[1;94m'
cyan='\e[1;96m'
white='\e[1;97m'
reset='\e[0m'
bold='\e[1m'
blink='\e[5m'

# Limpa a tela
clear

# Banner com pendrive estilizado
echo -e "${red}${bold}"
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║███╗   ███╗██╗███╗   ███╗ ██████╗ ███████╗██████╗ ██╗██╗   ██╗   ║"
echo "║████╗ ████║██║████╗ ████║██╔═══██╗██╔════╝██╔══██╗██║╚██╗ ██╔╝   ║"
echo "║██╔████╔██║██║██╔████╔██║██║   ██║█████╗  ██████╔╝██║ ╚████╔╝    ║"
echo "║██║╚██╔╝██║██║██║╚██╔╝██║██║   ██║██╔══╝  ██╔═══╝ ██║  ╚██╔╝     ║"
echo "║██║ ╚═╝ ██║██║██║ ╚═╝ ██║╚██████╔╝███████╗██║     ██║   ██║      ║"
echo "║╚═╝     ╚═╝╚═╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝   ╚═╝      ║"
echo "╠═══════════════[🖴 Painel Hacker Pro - by Mistico ]══════════════╣"
echo "║  🔥 Interface Profissional de Pentest | Whats: 11996896760     ║"
echo "║  🌐 Versão: 1.1.0 | Linux Shell       |   base: Black Cyber    ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo -e "${reset}"

# Carregamento interativo profissional
echo -e "${blue}${bold}\n[🖴] Inicializando o Painel Hacker Pro...\n${reset}"
mensagens=(
  "🔍 Injetando scripts de escaneamento..."
  "💉 Preparando SQLMap para exploração..."
  "📡 Ativando sensores de rede invisível..."
  "🔓 Quebrando senhas criptografadas..."
  "🧠 Conectando ao módulo Metasploit..."
  "📁 Montando arquivos de análise..."
  "⚙️  Ajustando variáveis de ambiente..."
  "📡 Sincronizando com servidores ocultos..."
)

for i in {1..30}; do
  barra=$(printf "%-${i}s" ""); barra=${barra// /█}
  mensagem=${mensagens[$((RANDOM % ${#mensagens[@]}))]}
  echo -ne "${cyan}\r[${barra:0:30}] ${yellow}${mensagem}${reset}  "
  sleep 0.07
done

echo -e "\n${green}${bold}✔ Sistema carregado com sucesso. Painel operacional.${reset}\n"

# Menu
echo -e "${cyan}${bold}[ MENU DE OPERAÇÕES HACKER PRO 🔐 ]${reset}"
echo -e "${cyan}─────────────────────────────────────────────${reset}"
echo -e "${cyan}[1]${reset} 🔎 Escanear Vulnerabilidades (nmap + nikto)"
echo -e "${cyan}[2]${reset} 🌐 Detectar Tecnologias (whatweb)"
echo -e "${cyan}[3]${reset} 💉 Testar SQL Injection (sqlmap)"
echo -e "${cyan}[4]${reset} 🗃️  Listar Bancos de Dados (sqlmap)"
echo -e "${cyan}[5]${reset} 📧 Caça e-mails/domínios (theHarvester)"
echo -e "${cyan}[6]${reset} 🔧 Scan WordPress (wpscan)"
echo -e "${cyan}[7]${reset} 🧠 Metasploit Handler (Payload automático)"
echo -e "${cyan}[8]${reset} 🔓 Quebrar senha ZIP/RAR (fcrackzip/unrar)"
echo -e "${cyan}[0]${reset} 🚪 Sair do Painel"
echo -e "${cyan}─────────────────────────────────────────────${reset}"

# Entrada do usuário
read -p $'\nDigite a opção desejada: ' op
echo

# Processamento de opções
case $op in
  1)
    read -p "Alvo (IP ou domínio): " alvo
    echo -e "${yellow}Iniciando NMAP + Nikto...${reset}"
    nmap -sV -A "$alvo"
    nikto -h "$alvo"
    ;;
  2)
    read -p "URL do site: " url
    whatweb "$url"
    ;;
  3)
    read -p "URL vulnerável: " url
    sqlmap -u "$url" --batch --risk=3 --level=5
    ;;
  4)
    read -p "URL vulnerável: " url
    sqlmap -u "$url" --dbs --batch
    ;;
  5)
    read -p "Domínio alvo: " dominio
    theHarvester -d "$dominio" -b all
    ;;
  6)
    read -p "URL do site WordPress: " site
    wpscan --url "$site"
    ;;
  7)
    read -p "LHOST (seu IP): " lhost
    read -p "LPORT (porta): " lport
    read -p "Payload (ex: windows/meterpreter/reverse_tcp): " payload
    msfconsole -q -x "use exploit/multi/handler; set PAYLOAD $payload; set LHOST $lhost; set LPORT $lport; exploit"
    ;;
  8)
    read -p "Caminho do arquivo zip/rar: " arquivo
    read -p "Wordlist (ex: /usr/share/wordlists/rockyou.txt): " wordlist
    if [[ $arquivo == *.zip ]]; then
      fcrackzip -u -D -p "$wordlist" "$arquivo"
    elif [[ $arquivo == *.rar ]]; then
      echo -e "${cyan}Tentando extrair com senha vazia...${reset}"
      unrar x -p- "$arquivo"
      echo -e "${yellow}Use rarcrack para wordlist em .rar${reset}"
    else
      echo -e "${red}Formato não suportado. Use .zip ou .rar${reset}"
    fi
    ;;
  0)
    echo -e "${red}Encerrando sessão, hacker... Até a próxima invasão!${reset}"
    exit
    ;;
  *)
    echo -e "${red}Opção inválida. Tente novamente.${reset}"
    ;;
esac
