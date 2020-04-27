POLL_TMP_CMD = "cat /sys/bus/w1/devices/#{ENV['CHILLER_ID']}/w1_slave".freeze
IFTTT_OFF_CMD = "curl -s -X POST https://maker.ifttt.com/trigger/chiller_off/with/key/#{ENV['IFTTT_KEY']} > /dev/null".freeze
IFTTT_ON_CMD = "curl -s -X POST https://maker.ifttt.com/trigger/chiller_on/with/key/#{ENV['IFTTT_KEY']} > /dev/null".freeze
HIGH_TEMP = 19.8.freeze
LOW_TEMP = 19.0.freeze

def ifttt_on
  `#{IFTTT_ON_CMD}`
end

def ifttt_off
  `#{IFTTT_OFF_CMD}`
end

def fetch_temp
  temp = `#{POLL_TMP_CMD}`.split('t=').last.chomp.to_f / 1000.0
  puts "#{Time.now.strftime('%m-%e-%y %H:%M')}, #{temp}"
  temp
end

def turn_chiller_on?
    fetch_temp > HIGH_TEMP

def turn_chiller_off?
    fetch_temp < LOW_TEMP
end

ifttt_on if turn_chiller_on?

ifttt_off if turn_chiller_off?