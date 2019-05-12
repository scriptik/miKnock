# Pezhman Shafigh
# PORT KNOKING Firewall rules 
/ip firewall address-list
add address=192.168.25.253 list=Admin
/ip firewall filter
add action=drop chain=input dst-port=20,21,22,23,80,8291 protocol=tcp \
    src-address-list=!Admin
add action=add-src-to-address-list address-list=ICMP address-list-timeout=20s \
    chain=input protocol=icmp
add action=add-src-to-address-list address-list="ICMP+TCP 8000" \
    address-list-timeout=20s chain=input dst-port=10000 protocol=tcp \
    src-address-list=ICMP
add action=add-src-to-address-list address-list=Admin address-list-timeout=5h \
    chain=input dst-port=15000 protocol=tcp src-address-list="ICMP+TCP 8000"
