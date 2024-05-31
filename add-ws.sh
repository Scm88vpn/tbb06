#!/bin/bash
#Script By SCM88

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Scm88vpn/permission/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Scm88vpn/permission/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Scm88vpn/permission/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
source /var/lib/scrz-prem/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
clear
  echo -e "\033[96;1m────────────────────────────────────────────\033[0m"
  echo -e "\033[92;1m          SCMVIP TUNNELING   \033[0m"
  echo -e "\033[96;1m────────────────────────────────────────────\033[0m"
  echo -e " "
  echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
  echo -e "\033[1;96m         CREATE TITLE  XRAY / VMESS \033[0m"
  echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
  echo -e ""
		read -rp "USERNAME :  " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo ""
            echo ""
			echo -e "\033[1;91mSorry, this name already exists"
			echo ""
			sleep 3
      addws
		fi
	done
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
CITY=$(curl -s ipinfo.io/city)
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "EXPIRED (DAY) " masaaktif
read -p "LIMIT QUOTA (GB): " Quota
read -p "LIMIT DEVIC (IP): " iplimit
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessworry$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmesskuota$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1


cat >/var/www/html/vmess-$user.txt <<-END
---------------------------------------------------
# Format Vmess WS TLS
---------------------------------------------------
- name: Vmess-$user-WS TLS
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
---------------------------------------------------
# Format Vmess WS Non TLS
---------------------------------------------------
- name: Vmess-$user-WS Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
---------------------------------------------------
# Format Vmess gRPC
---------------------------------------------------
- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

---------------------------------------------------
 Link Akun Vmess                   
---------------------------------------------------
Link TLS         : 
${vmesslink1}
---------------------------------------------------
Link none TLS    : 
${vmesslink2}
---------------------------------------------------
Link GRPC        : 
${vmesslink3}
---------------------------------------------------

END
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vmess/ip
echo -e "$iplimit" > /etc/kyt/limit/vmess/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vmess/.vmess.db
clear
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>---------------------------------------------------</code>
<code>      XRAY/VMESS</code>
<code>---------------------------------------------------</code>
<code>Remarks   : ${user}
Domain    : ${domain}
Limit Quota : ${Quota} GB
Port TLS  : 400-900
Port NTLS : 80, 8080, 8081-9999
id        : ${uuid}
alterId   : 0
Security  : auto
network   : ws or grpc
Path      : /Multi-Path
Dynamic   : https://bugmu.com/path
Name      : vmess-grpc</code>
<code>---------------------------------------------------</code>
<code> VMESS WS TLS</code>
<code>---------------------------------------------------</code>
<code>${vmesslink1}</code>
<code>---------------------------------------------------</code>
<code>VMESS WS NO TLS</code>
<code>---------------------------------------------------</code>
<code>${vmesslink2}</code>
<code>---------------------------------------------------</code>
<code> VMESS gRPC</code>
<code>---------------------------------------------------</code>
<code>${vmesslink3}</code>
<code>---------------------------------------------------</code>
Format OpenClash : https://${domain}:81/vmess-$user.txt
<code>---------------------------------------------------</code>
Aktif Selama   : $masaaktif Hari
Dibuat Pada    : $tnggl
Berakhir Pada  : $expe
<code>---------------------------------------------------</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
clear
echo -e "---------------------------------------------------------------"
echo -e "                          Xray/Vmess"
echo -e "---------------------------------------------------------------"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "User Quota       : ${Quota} GB"
echo -e "User Ip            : ${iplimit} IP"
echo -e "Port TLS         : 400-900"
echo -e "port None TLS/WS : 80,8880,8080,2082,2086"
echo -e "id               : ${uuid}"
echo -e "Localtions      : $CITY"
echo -e "ISP             : $ISP"
echo -e "alterId          : 0"
echo -e "Security         : auto"
echo -e "Network          : ws"
echo -e "Path             : /vmess"
echo -e "Dynamic Path    : https://bugmu.com/vmess"
echo -e "ServiceName      : vmess-grpc"
#echo -e "Host XrayDNS : ${NS}"
echo -e "Location         : $CITY"
#echo -e "Pub Key          : ${PUB}"
echo -e "---------------------------------------------------------------"
echo -e "Link TLS         : ${vmesslink1}"
echo -e "---------------------------------------------------------------"
echo -e "Link none TLS    : ${vmesslink2}"
echo -e "---------------------------------------------------------------"
echo -e "Link GRPC        : ${vmesslink3}"
echo -e "---------------------------------------------------------------"
echo -e "Format OpenClash : https://${domain}:81/vmess-$user.txt"
echo -e "---------------------------------------------------------------"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "---------------------------------------------------------------"
echo -e ""
read -p "press !! [ ENTER ] To Menu"
menu
