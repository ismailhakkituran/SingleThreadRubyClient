require 'socket'
require_relative 'subscriber_pb'  # Generated Ruby code from subscriber.proto

# The generated code will define module Subscriberinfo and class Subscriber
#   e.g., Subscriberinfo::Subscriber
# status types: subscribed, online, offline

def main
  # 1. Create a Subscriber object
  subscriber = Subscriberinfo::Subscriber.new(
    subscriber_id: 12345,
    name: "Ruby Tester",
    status: "online"
  )

  # 2. Serialize the Subscriber object to Protobuf binary
  data = Subscriberinfo::Subscriber.encode(subscriber)

  # 3. Connect to the server
  server_host = 'localhost'
  server_port = 5002

  begin
    socket = TCPSocket.new(server_host, server_port)
    puts "Connected to server at #{server_host}:#{server_port}"

    # 4. Send the serialized data
    socket.write(data)
    puts "Protobuf Subscriber sent to server."

    socket.close
  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end

main if __FILE__ == $PROGRAM_NAME

