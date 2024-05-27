# Ack producer cli
#
# This is the producer cli that send data
# to the stack socket service aka ack.
#
# Run
#   ruby producer.rb "message"

require "socket"
require "logger"
require "securerandom"

logger = Logger.new($stdout)
# The socket path must be the same as the server
SOCKET_PATH = "/tmp/ack.sock"

puts "Producer v0.0.1"
puts "Socket running at #{SOCKET_PATH}"

begin
  logger.info "Preparing socket connection"
  client = UNIXSocket.new(SOCKET_PATH)
  logger.info "Connected to server"

  message = SecureRandom.uuid
  logger.info "Sending -- [#{message}]"
  client.puts "push #{message}"
  response = client.gets

  logger.info "Server response -- [#{response.strip}]"

  logger.info "Closing connection"
  client.close
rescue Errno::ENOENT
  puts "Socket file not found, is the server running?"
end
