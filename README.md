ltc-rate-check
==============

Checks various LTC exchanges for current rates in USD/EUR and optionally calculates earnings.

![Example screenshot of ltc-rate-check](http://i.imgur.com/Y0WXvBD.png)

Requirements/Installation
-----
Needs the excellent [jq](http://stedolan.github.io/jq/) to process JSON, available in most package managers. Then either clone the repository or simply download the [raw bash script](https://github.com/matrixagent/ltc-rate-check/raw/master/ltc-rate-check.sh) and make it executable.  

Usage
-----
```./ltc-rate-check.sh [your amount of litecoins]```  
It also works great in an infinite loop for all your LTC value obsessing needs: ```while [ 1 = 1 ]; do ./ltc-rate-check.sh [your amount of litecoins];sleep [seconds before refreshing]; done```

Supported Exchanges
-------------------
Currently, the following exchanges are the only ones trading LTC to USD or EUR that are also offering something close enough to a meaningful API to use them for the purposes of this script. If you happen to know of any other, please let me know and I'll happily add them (or send me a pull request).

* crypto-trade.com
* btc-e.com
* kraken.com
* therocktrading.com

FAQ
---
* *Damn, that code is horrible!*  
  Not a question, and I know. Sometimes the output even has alignment errors or worse! It works for me and evolved from a few terminal commands I entered way too frequently, that's all I needed.
* *Why didn't you write it in NodeJS, Ruby, Python, Go?*  
  I'm not hip enough.
* *What's the difference between Last and Avg?*  
  Some exchanges don't offer an average value in their API, in that case the script uses the value that LTCs had in the most recent transaction on that exchange.
* *How are the estimated earnings calculated?*  
  Your own amount of LTC is multiplied with the LTC value in the Avg/Last column.
* *I like it, how can I thank you?*  
  Let me know via any means, it will make me happy. Or send me some LTC to **LWWi5tTj9YGhnXNVGpDZAwUyx83WeKx7Jx**
