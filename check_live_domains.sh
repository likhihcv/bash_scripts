#check if the domain/subdoamin exists or not. it works by trying to fetch the ip. if ip for domain/subdomain exits then the domain/subdomain is working. but service might me running on some other port
#command: ./check_live_domains.sh [file_name has=ving domain]
trap "exit" INT
while read F  ; do
        host $F | grep "has address" | cut -d " " -f1
done < $1
