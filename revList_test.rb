require 'minitest/autorun'
require_relative 'linkedListNode'
require_relative 'stack'

class TestRevList < MiniTest::Unit::TestCase
  
    @@node1 = LinkedListNode.new(37)
    @@node2 = LinkedListNode.new(99, @@node1)
    @@node3 = LinkedListNode.new(12, @@node2)
  
  def test_revList1
    expected = [@@node1.value, @@node2.value, @@node3.value] 
    
    rev = reverse_list1(@@node3)
    actual = [rev.value, rev.next_node.value, rev.next_node.next_node.value]
    
    puts"\ntest reverse_list1"
    print_values(@@node3)
    puts "-------"
    print_values(rev)

    assert_equal expected, actual
  end
  
  def test_revList2
    expected = [@@node1.value, @@node2.value, @@node3.value] 
    
    rev = reverse_list2(@@node3)
    actual = [rev.value, rev.next_node.value, rev.next_node.next_node.value]
    
    puts "\ntest reverse_list2"
    print_values(@@node3)
    puts "-------"
    print_values(rev)
    
    assert_equal expected, actual
  end
  
  def test_infinite
    node4 = LinkedListNode.new(37)
    node5 = LinkedListNode.new(99, node4)
    node6 = LinkedListNode.new(12, node5)
    node4.next_node = node6

    expected1 = true
    actual1 = is_infinite(node6)
    
    assert_equal expected1, actual1

    expected2 = false
    actual2 = is_infinite(@@node3)
    
    puts "infinite"

    assert_equal expected2, actual2
  end
  
  def test_popStack
    test_stack = Stack.new
    
    test_stack.push(@@node3)
    test_stack.push(@@node2)
    test_stack.push(@@node1)
    
    puts "\nstack"
    print_values(test_stack.data)
    
    expected = @@node1.value
    actual = test_stack.pop.value
    
    puts "-------------\n"
    puts "popped = #{actual}"
    print_values(test_stack.data)
    
    assert_equal expected, actual
  end
end