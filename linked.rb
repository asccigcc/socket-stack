# Example of a single linked list data structure

# This is the Node that contains the objext
# The data structure looks in memory like this:
#
# [ Value | next -> ]
#
# Where value is the primitive that we are going to save
# And next is the pointer that point to the next value
class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end


# This is the algorithm class that apply the operations
# on the Node data structure
class LinkedList
  def initialize
    @head = nil
  end

  # Add new item at the end
  # of the list, this will traverse the
  # list from where the head is
  def append(value)
    new_node  = Node.new(value)

    # This is in case that we have an empty
    # linked list
    return @head = new_node if @head.nil?

    # This will traverse the linked list until find the
    # last item and the insert at the end
    current = @head # The head always will be the first item
    current = current.next until current.next.nil?
    current.next = new_node

    current
  end

  # Add new item at the begining of the list
  def prepend(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node # Need to point now the head to the new item prepended
  end

  # return what head has
  def first
    @head
  end

  # walk through the list and return the last item
  def last
    current = @head
    until current.next.nil?
      current = current.next
    end

    current
  end

  def display
    current = @head

    while current
      print "#{current.value} -> "
      current = current.next
    end

    puts "nil"
  end

  def values
    return [] if @head.nil?

    current = @head
    values = []

    while current
      values << current.value
      current = current.next
    end

    values
  end

  # accessing (index)
  def index(index)
    return nil if @head.nil?
    return @head.value if index == 0

    steps = 0
    current = @head

    while steps != index
      current = current.next
      steps += 1
    end

    current.value
  end

  # traversal
  def search(value)
    return nil if @head.nil?

    current = @head

    while current
      return current.value if current.value == value

      current = current.next
    end
  end

  def size
    count = 0

    return count if @head.nil?

    current = @head

    while current
      count += 1
      current = current.next
    end

    count
  end

  def reverse
    return nil if @head.nil?

    return_reverse
  end


  # change the instance order
  def reverse!
    return nil if @head.nil?

    @head = return_reverse
  end

  # delete
  def delete_head
    return nil if @head.nil?

    remove_item = @head
    @head = @head.next

    value = remove_item.value
    remove_item = nil

    value
  end

  def delete_last
    return nil if @head.nil?

    current = @head
    next_item = nil

    until current.next.nil?
      current = current.next
      next_item = current.next

      break if next_item.next.nil?
    end

    # remove the next item overwritting the previous next item
    current.next = nil

    value = next_item.value
    next_item = nil

    value
  end

  def delete_by_value(value)
    return nil if @head.nil?

    if @head.value == value
      delete_head

      return value
    end

    current = @head
    prev_item = nil
    next_item = nil

    until current.next.nil?
      if current.value == value
        # we remove the current item
        # pointing the previous to the next item
        prev_item.next = next_item
        current = nil

        return value
      end

      prev_item = current
      current = current.next
      next_item = current.next
    end
  end

  def delete_by_index(idx)
    return nil if @head.nil?

    if idx == 0
      value = @head.value
      delete_head

      return value
    end

    idx_steps = 0
    prev_item = nil
    current = @head
    next_item = nil

    while idx_steps != idx

      idx_steps += 1
      prev_item = current
      current = current.next

      return if current.nil?

      next_item = current.next
    end

    prev_item.next = next_item

    value = current.value
    current = nil

    value
  end

  def clear
    return nil if @head.nil?

    current = @head

    until current.next.nil?
      prev_item = current
      current = current.next

      prev_item = nil
    end

    @head = nil
  end

  # insertion middle
  # delete middle

  private

  attr_accessor :head

  def return_reverse
    current = @head
    reverse = Node.new(current.value)
    reverse.next = nil

    while current
      current = current.next # we need to walk through the list

      break if current.nil?

      new_node = Node.new(current.value)
      new_node.next = reverse
      reverse = new_node # Nee to point now the head to the new item prepended
    end

    reverse
  end
end
