# Ack is a UnixSocket service that starts the
# Stack Object.
#
# The service receive and response Messages
# that were saved on the Stack.
#
# Run:
#   ruby socket-stack.rb

require 'socket'
require 'logger'
require 'pry'

require_relative "stack"
require_relative "handle_request"

logger = Logger.new($stdout)
# Start our Unix Socket
SOCKET_PATH = "/tmp/ack.sock"
# Validate if file path exist
if File.exist?(SOCKET_PATH) && File.socket?(SOCKET_PATH)
  File.unlink(SOCKET_PATH)
end

puts "SocketStack v0.0.1"
server = UNIXServer.new(SOCKET_PATH)

trap('INT') do
  abort('Interrupted by user')
end

# Initialize the request handler
# Initialize the Stack class
stack = Stack.new
handle_request = HandleRequest.new(stack)

puts "Socket Running at #{SOCKET_PATH}"
puts "Press CTRL + C to terminate the service"

loop do
  client = server.accept
  logger.info "Receiving client message"

  # request format [METHOD MESSAGE]
  request = client.gets
  logger.info "Message received -- [#{request.strip}]"

  response = handle_request.route(request)
  logger.info "Sending response -- [#{response}]"
  client.puts response

  logger.info "Client disconnected"
  client.close
end

at_exit do
  logger.close
  server.close
end

