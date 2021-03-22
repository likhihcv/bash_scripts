#this script will check only if the service is running on 80 and 443, if 80 then its http mostly and https if it is 443

trap "exit" INT
while read F  ; do
        ip=$(host $F | grep "has address" | cut -d " " -f4)
        echo $(echo -ne "$F HTTP(80) **";nc -w 1 -znv $ip 80 2>&1) | grep "succeeded" | cut -d " " -f1,2
        echo $(echo -ne "$F HTTPS(443) **";nc -w 1 -znv $ip 443 2>&1) | grep "succeeded" | cut -d " " -f1,2
done < $1
