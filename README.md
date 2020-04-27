# hydroponics-helpers
This repository contains scripts I've created to automate aspects on my Deep Water Culture Hydroponics setup. This software will be run on a raspberry pi.

### chiller.rb
This is a very simple ruby script the does the following:
Queries the value from a DS18B20 Teperature sensor connected to the raspberry pi, and converts it to degrees Celcius represented by a float.
If the normalized celcius value is either above or below preset values, REST calls are made out to IFTTT to turn a smart plug on or off.

This script is used in conjunction with cron e.g. `*/5 * * * * /usr/bin/ruby /root/chiller.rb >> /root/cronOutput.txt 2>&1`, so that the script is run every five minutes. In this way we don't need to worry about looping or sleeping in ruby itself. The Temperature probe is submerged in the DWC reservoir. Inside the reservoir is a pump that forces water through a water [chiller](https://www.amazon.ca/gp/product/B07FY6Q232?pf_rd_r=94NDGAQQ20Q2RW9G9S9G&pf_rd_p=05326fd5-c43e-4948-99b1-a65b129fdd73), the forced water drains back into the reservoir. The water chiller is connected to a smart wall plug, such that the chiller can be programatically enabled and disabled. 


### Future ideas
I would like to continue to build out the suite of scripts, possible ideas include:
- Automated PH Control
- Humidity Control
- CO2 Monitoring
- Ventalation Control
