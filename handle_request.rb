# This class based on the request message
# calls the method from the injected class.

# Handle which method execute from the device
# class depending on what request receives.
#
# Usage:
#
#   handler = HandleRequest.new(MyDeviceClass)
#   handler.route("method value")
#
# The router method receives a message with the
# following schema:
#
# "method value"
#
# - method is the name of the method that the device will trigger
# - value is the value that we want to pass to the device class.
class HandleRequest
  def initialize(device)
    @device = device
  end

  def route(request)
    cmd, val = request.split

    case cmd.downcase
    when 'push'
      return 'Error' if val.nil?

      device.push(val)
    when 'pop'
      device.pop
    when 'ping'
      'pong'
    when 'version'
      '0.0.1'
    end
  end

  private

  attr_reader :device
end
