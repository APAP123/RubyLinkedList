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

  def insert_at(value, index)
    return prepend(value) if index == 0

    curr_node = @head_node
    prev_node = @head_node
    for i in 0..index
      if i == index
        new_node = Node.new(value)
        prev_node.next_node = new_node
        return new_node.next_node = curr_node
      end
      prev_node = curr_node
      curr_node = curr_node.next_node
    end
    nil
  end

  def remove_at(value, index)
    # todo
  end

  def at(index)
    curr_node = @head_node
    for i in 0..index
      return curr_node.value if i == index
      return nil if curr_node.next_node.nil?

      curr_node = curr_node.next_node
    end
  end

  def pop
    curr_node = @head_node
    curr_node = curr_node.next_node until curr_node.next_node == @tail_node
    @tail_node = curr_node
    tail_node.next_node = nil
    tail_node
  end

  # Looks for and returns index of node that matches passed value (starting from 0); returns nil if not found
  def contains?(value)
    curr_node = @head_node
    index = 0
    until curr_node.nil?
      return index if curr_node.value == value

      curr_node = curr_node.next_node
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
puts linked.pop.value
puts linked.to_s
puts linked.contains?(2)
linked.prepend(13)
puts linked.to_s
linked.append(57)
linked.append(42)
linked.append(7)
puts linked.to_s
puts linked.at(5)
linked.insert_at(789, 3)
puts linked.to_s
