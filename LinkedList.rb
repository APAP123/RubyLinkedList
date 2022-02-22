class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Represents the entire LinkedList
class LinkedList
  attr_accessor :head_node, :tail_node
  
  def initialize(node)
    @head_node = node
    @tail_node = node
  end

  def append(value)
    @tail_node.next_node = Node.new(value)
    @tail_node = @tail_node.next_node
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head_node
    @head_node = node
  end

  def at(index)
    curr_node = @head_node
    for i in 0..index
      return curr_node.value if i == index
      return nil if curr_node.next.nil?
    end
  end

  def find_new_tail(node)
    return @tail_node = node if node.next_node == nil
    find_new_tail(node.next_node)
  end

  def pop
    @tail_node = nil
    find_new_tail(@head_node)
  end

  def contains?(value)
    curr_node = @head_node
    index = 0
    until curr_node.nil?
      return index if curr_node.value == value

      index += 1
    end
    nil
  end

  def to_s
    curr_node = @head_node
    string = ''
    until curr_node.nil?
      string += "( #{curr_node.value} ) -> "
      curr_node = curr_node.next_node
    end
    string + 'nil'
  end
end

linked = LinkedList.new(Node.new(1))

linked.append(2)
linked.append(3)
linked.append(4)
linked.append(5)

puts linked.to_s
