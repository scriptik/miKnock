# Pezhman Shafigh
# PORT KNOKING daily secret generator Python 
from datetime import datetime, date, timedelta

Salt=456
SaltPort=30
MainPort=10000

time = datetime.now()
ymd = (str(time)[:10])
year = int(ymd[:4])
month = int(ymd[5:7])
day = int(ymd[8:10])

if day < 15:
   newPassword = (year - day - month + Salt)
else:
   newPassword = (year + day + month - Salt)

PortOne = (MainPort + newPassword - SaltPort)
PortTwo = (MainPort - newPassword + SaltPort)

print(newPassword, PortOne, PortTwo)
print("ping -c3 192.168.5.5 ; knock 192.168.5.5 "+str(PortOne)+":tcp "+str(PortTwo)+":tcp")
