class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list2(list, previous = nil)
  if previous.nil?
    head = LinkedListNode.new(list.value)
  else
    head = LinkedListNode.new(list.value, previous)
  end
  
  if list.next_node.nil?
    return head
  else
    reverse_list2(list.next_node, head)
  end
end

def is_infinite(list)
  start_node = list

  while !list.next_node.nil?
    list = list.next_node
    if list == start_node
      return true
    end
  end
  
  return false
end



