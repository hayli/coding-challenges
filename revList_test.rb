require 'minitest/autorun'
require_relative 'linkedListNode'

class TestRevList < Minitest::Test
    
    def test_revList
        
        node1 = LinkedListNode.new(37)
        node2 = LinkedListNode.new(99, node1)
        node3 = LinkedListNode.new(12, node2)
 
        print_values(node3)
    
        expected = [node3.value, node2.value, node1.value]
        actual = node3.reverse_list(self)
        
        assert_equal expected, actual
        
        print_values(actual)
    end
    
end

