require_relative 'enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")
enigmatext = handle.read
handle.close

decrypted_message = enigma.decrypt(enigmatext, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(decrypted_message)
writer.close

key = decrypted_message[:key]
date = decrypted_message[:date]

puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"