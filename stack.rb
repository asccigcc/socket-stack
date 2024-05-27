# This class apply the linked list class in order
# to build the stack data structure which will be used
# for different examples.

require "json"
require_relative "linked"

# Stack class
#
# Implements LinkedList class to handle
# the stack memory.
#
# To start the stack just need to initialize and
# instance:
#
#   stack = Stack.new
#
# To add items to the stack only requires call
# push:
#
# stack.push("my message")
#
# To get the value from the stack's top
# just need to call pop:
#
#   stack.pop
#   => "my message"
#
class Stack
  def initialize
    @list = LinkedList.new
  end

  # Insert a message into the top
  # of the stack and return the value
  #
  #   stack.push("my message")
  #
  # The message can be anything.
  def push(msg)
    list.prepend(msg).value
  end

  # Extract the message that is on the
  # stack top
  #
  #   stack.pop
  #   #=> "my message"
  def pop
    list.delete_head
  end

  # Return what is on the top of the stack
  def peek
    list.first
  end

  # return if the stack is empty or not
  def empty?
    list.size.zero?
  end

  # return how many items are on the stack
  def size
    list.size
  end

  # clear all the stack
  def clear
    list.clear
  end

  # return an array of all the items
  # from the stack ordered from the last to the
  # first inserted
  def to_a
    list.values
  end

  private

  attr_accessor :list
end
