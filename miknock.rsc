# Pezhman Shafigh
# PORT KNOKING daily secret generator 
:local Salt 456
:local SaltPort 30
:local MainPort 10000
:local dateNow [/system clock get date];
:local dateNowDay [:pick $dateNow 4 6]
:local dateNowMonth [:pick $dateNow 0 3]
:local dateNowYear [:pick $dateNow 7 11]
:put ($dateNow , $dateNowDay , $dateNowMonth , $dateNowYear)
:local months ("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec");
:set dateNowMonth ([:find $months $dateNowMonth -1 ] + 1)
#:if ( $dateNowMonth < 10 ) do={
#:set $dateNowMonth ("0"."$dateNowMonth");
#};
#:local newPassword ("$dateNowDay" . "$dateNowMonth" . "$dateNowYear");
:put ("$dateNowDay")
:put ("$dateNowMonth");
:put ("$dateNowYear");
:put ("##############################");
:local newPassword ("$dateNowYear" + "$dateNowDay" + "$dateNowMonth" - "$Salt");
#:local newPassword
:if ( $dateNowDay < 15 ) do={
:set newPassword ("$dateNowYear" - "$dateNowDay" - "$dateNowMonth" + "$Salt");
};

:local PortOne ("$MainPort" + "$newPassword" - "$SaltPort");
:local PortTwo ("$MainPort" - "$newPassword" + "$SaltPort");


:put ($PortOne)
:put ($PortTwo)
# / ip firewall filter set numbers=3 dst-port=$PortOne
# / ip firewall filter set numbers=4 dst-port=$PortTwo

/ip firewall filter set dst-port=$PortOne [find comment=knockP1];
/ip firewall filter set dst-port=$PortTwo [find comment=knockP2];

