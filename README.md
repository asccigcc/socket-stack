# Socket Stack

Simple UnixSocket service that provides a Stack memory to save messages.

> This is an exercise project not for production.

## Usage

This service has 3 components:

- `socket-stack.rb` This is the service that start the socket and provides communication with the stack.
- `producer.rb` This is the script that produces the message and sent to the service to save into the stack.
- `consumer.rb` This is another service that is monitoring if there is a new message on the top stack and extract.


### How to run

First need to start the `socket-stack.rb`

```
ruby socket-stack.rb
```

After is done we can run the `consumer.rb`

```
ruby consumer.rb
```

This service will print on the terminal that not message received yet.

The last script is the `producer.rb` which is going to create a UUID and sent to the `socker-stack.rb` file to save into the
stack. This script should be executed eveytime that we want to send a message.

```
ruby producer.rb
```



