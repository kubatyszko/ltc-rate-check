#!/bin/bash

if [ -z "$1" ]; then amount='0.0'; else amount=$1; fi

echo '======================================================================================'

printf "%-20s %-15s %-15s %-15s %-15s %s\n" ' ** Market (EUR) ** ' '| HIGH' '| LOW' '| AVG/LAST' '| EST. EARN' '|'
echo '--------------------------------------------------------------------------------------'

cccom=`curl -s -k https://crypto-trade.com/api/1/ticker/ltc_eur`
if [[ $cccom =~ .*error.* ]]
then
  cccomlow=`echo '-'`
  cccomhigh=`echo '-'`
  cccomlast=`echo '-'`
  cccomearn=`echo '-'`
else
  cccomlow=`echo $cccom | jq '.data.low | tonumber'`
  cccomhigh=`echo $cccom | jq '.data.high | tonumber'`
  cccomlast=`echo $cccom | jq '.data.last | tonumber'`
  cccomearn=`echo "$cccomlast * $amount" | bc`
fi
printf "%-20s %-15s %-15s %-15s %-15s %s\n" 'crypto-trade.com' "| $cccomhigh" "| $cccomlow" "| (L) $cccomlast" "| € $cccomearn" '  |'


btce=`curl -s -k https://btc-e.com/api/2/ltc_eur/ticker`
btcehigh=`echo $btce | jq '.ticker.high'`
btcelow=`echo $btce | jq '.ticker.low'`
btceavg=`echo $btce | jq '.ticker.avg'`
btceearn=`echo "$btceavg * $amount" | bc`
printf "%-20s %-15s %-15s %-15s %-15s %s\n" 'btc-e.com' "| $btcehigh" "| $btcelow" "| (A) $btceavg" "| € $btceearn" '  |'

kraken=`curl -s -k https://api.kraken.com/0/public/Ticker?pair=XLTCZEUR`
krakenhigh=`echo $kraken | jq '.result.XLTCZEUR.h[1] | tonumber'`
krakenlow=`echo $kraken | jq '.result.XLTCZEUR.l[1] | tonumber'`
krakenavg=`echo $kraken | jq '.result.XLTCZEUR.p[1] | tonumber'`
krakenearn=`echo "$krakenavg * $amount" | bc`
printf "%-20s %-15s %-15s %-15s %-15s %s\n" 'kraken.com' "| $krakenhigh" "| $krakenlow" "| (A) $krakenavg" "| € $krakenearn" '  |'

therock=`curl -s -k https://www.therocktrading.com/api/ticker/LTCEUR`
therockhigh=`echo $therock | jq '.result[0].ask | tonumber'`
therocklow=`echo $therock | jq '.result[0].bid | tonumber'`
therocklast=`echo $therock | jq '.result[0].last | tonumber'`
therockearn=`echo "$therocklast * $amount" | bc`
printf "%-20s %-15s %-15s %-15s %-15s %s\n" 'The Rock' "| $therockhigh" "| $therocklow" "| (L) $therocklast" "| € $therockearn" '  |'



echo '--------------------------------------------------------------------------------------'
printf "%-20s %-15s %-15s %-15s %-15s %s\n" ' ** Market (USD) ** ' '| HIGH' '| LOW' '| AVG/LAST' '| EST. EARN' '|'
echo '--------------------------------------------------------------------------------------'

usdcccom=`curl -s -k https://crypto-trade.com/api/1/ticker/ltc_usd`
if [[ $usdcccom =~ .*error.* ]]
then
  usdcccomlow=`echo '-'`
  usdcccomhigh=`echo '-'`
  usdcccomlast=`echo '-'`
  usdcccomearn=`echo '-'`
else
  usdcccomlow=`echo $usdcccom | jq '.data.low | tonumber'`
  usdcccomhigh=`echo $usdcccom | jq '.data.high | tonumber'`
  usdcccomlast=`echo $usdcccom | jq '.data.last | tonumber'`
  usdcccomearn=`echo "$usdcccomlast * $amount" | bc`
fi
printf "%-20s %-15s %-15s %-15s %-15s %s\n" 'crypto-trade.com' "| $usdcccomhigh" "| $usdcccomlow" "| (L) $usdcccomlast" "| $ $usdcccomearn" '|'

usdbtce=`curl -s -k https://btc-e.com/api/2/ltc_usd/ticker`
usdbtcehigh=`echo $usdbtce | jq '.ticker.high'`
usdbtcelow=`echo $usdbtce | jq '.ticker.low'`
usdbtceavg=`echo $usdbtce | jq '.ticker.avg'`
usdbtceearn=`echo "$usdbtceavg * $amount" | bc`
printf "%-20s %-15s %-15s %-15s %-15s %s\n" 'btc-e.com' "| $usdbtcehigh" "| $usdbtcelow" "| (A) $usdbtceavg" "| $ $usdbtceearn" '|'

usdkraken=`curl -s -k https://api.kraken.com/0/public/Ticker?pair=XLTCZUSD`
usdkrakenhigh=`echo $usdkraken | jq '.result.XLTCZUSD.h[1] | tonumber'`
usdkrakenlow=`echo $usdkraken | jq '.result.XLTCZUSD.l[1] | tonumber'`
usdkrakenavg=`echo $usdkraken | jq '.result.XLTCZUSD.p[1] | tonumber'`
usdkrakenearn=`echo "$usdkrakenavg * $amount" | bc`
printf "%-20s %-15s %-15s %-15s %-15s %s\n" 'kraken.com' "| $usdkrakenhigh" "| $usdkrakenlow" "| (A) $usdkrakenavg" "| $ $usdkrakenearn" '|'

usdtherock=`curl -s -k https://www.therocktrading.com/api/ticker/LTCUSD`
usdtherockhigh=`echo $usdtherock | jq '.result[0].ask | tonumber'`
usdtherocklow=`echo $usdtherock | jq '.result[0].bid | tonumber'`
usdtherocklast=`echo $usdtherock | jq '.result[0].last | tonumber'`
usdtherockearn=`echo "$usdtherocklast * $amount" | bc`
printf "%-20s %-15s %-15s %-15s %-15s %s\n" 'The Rock' "| $usdtherockhigh" "| $usdtherocklow" "| (L) $usdtherocklast" "| $ $usdtherockearn" '|'

echo '======================================================================================'

echo ' '

date

echo ' '
