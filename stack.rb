require_relative 'linkedListNode'

class Stack
  attr_reader :data
    
  def initialize
      @data = nil
  end

  # Push an item onto the stack
  def push(node)
    if @data.nil?
      @data = LinkedListNode.new(node.value)
    else
      @data = LinkedListNode.new(node.value, @data)
    end
  end

  # Pop an item off the stack.  
  # Remove the last item that was pushed onto the
  # stack and return it to the user
  def pop
    last = LinkedListNode.new(@data.value)
    @data = @data.next_node
    return last
  end
end


def reverse_list1(list_node)
  rev = Stack.new
  
  while !list_node.nil?
    rev.push(list_node)
    list_node = list_node.next_node
  end
  
  return rev.data
end
