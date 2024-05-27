# Ack producer cli
#
# This is the consumer cli that retrieves
# what is on the stack socket service aka ack.
#
# Will print on the STDOUT the message.
#
# Run
#   ruby consumer.rb

require "socket"
require "logger"
require "pry"

logger = Logger.new($stdout)
# The socket path must be the same as the server
SOCKET_PATH = "/tmp/ack.sock"

puts "Consumer v0.0.1"
puts "Socket running at #{SOCKET_PATH}"
puts "Press CTRL + C to terminate the service"

trap('INT') do
  abort('Interrupted by user')
end

begin
  loop do
    logger.info "Preparing socket connection"
    client = UNIXSocket.new(SOCKET_PATH)
    logger.info "Connected to server"

    client.puts "pop"
    response = client.gets.strip

    if response.empty?
      logger.info "No items received"
    else
      logger.info "Server response -- [#{response.strip}]"
    end

    client.close
    sleep(5.2)
  end
rescue Errno::ENOENT
  puts "Socket file not found, is the server running?"
end

at_exit do
  logger.info "Closing connection"
  logger.close
end
