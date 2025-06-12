class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # First, create a new node. 
  # Then, if the list is empty, just assign the node as @head.
  # Otherwise, set the next_node of @tail as the "new_node"
  def append(value)
    temp = Node.new(value)
    if @head.nil?
      @head = temp
      @tail = temp
    else
      @tail.next_node = temp
      @tail = temp
    end
  end
  
  # First, create a new node. 
  # Then, if the list is empty, just assign the node as @head.
  # Otherwise, set the next_node of the "new_node" to @head and change @head as the "new_node"
  def prepend(value)
    temp = Node.new(value)
    if @head.nil?
      @head = temp
      @tail = temp
    else
      temp.next_node = @head
      @head = temp
    end
  end

  def size
    # if the list is empty
    if @head.nil?
      return 0
    end

    # if the list is not empty
    count = 1
    node = @head
    while node.next_node.nil? == false
      count += 1
      node = node.next_node
    end
    return count
  end

  def head
    return @head
  end

  def tail
    return @tail
  end

  def at(index)
    # Check if the list is empty or the index is negative
    if index < 0 || @head.nil?
      puts "Error: The list is empty or the index is negative."
      return nil
    end
    
    if index == 0
      return @head
    end
    
    count = 1
    node = @head.next_node

    while node != nil
      if count == index
        return node
      end
      node = node.next_node
      count += 1
    end
    
    # puts "The list doesn't contain node with that index."
    return nil
  end

  def pop
    tail = @tail
    node = @head
    while node.next_node != @tail
      node = node.next_node
    end
    node.next_node = nil
    @tail = node
    return tail
  end

  def contains?(value)
    if @head.nil?
      return false
    else
      node = @head
      while node != nil
        if node.value == value
          return true
        else
          node = node.next_node
        end
      end
    end
    return false
  end

  def find(value)
    index = 0
    if @head.nil?
      return nil
    else
      node = @head
      while node != nil
        if node.value == value
          return index
        else
          index += 1
          node = node.next_node
        end
      end
    end
    return nil
  end

  def to_s
    node = @head
    while node != nil
      printf "(#{node.value}) -> "
      node = node.next_node
    end
    p node
  end

  def insert_at(value, index)
    if index < 0 || @head.nil?
      puts "Error: The list is empty or the index is negative."
      return nil
    end
    
    node = at(index - 1)
    if node == nil
      return nil 
    end

    temp_node = at(index)
    node.next_node = Node.new(value)
    node.next_node.next_node = temp_node
  end

  def remove_at(index)
    if index < 0 || @head.nil?
      puts "Error: The list is empty or the index is negative."
      return nil
    end

    if index = 0
      @head = at(1)
    end

    node = at(index - 1)
    node.next_node = at(index + 1)
  end

end

# Test it out from ODIN PROJECT
list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

list.to_s
list.insert_at('idk', 2)
list.to_s
list.remove_at(2)
list.to_s


# Debugging

# testing = LinkedList.new

# puts " \n--- Testing the #adding functions ---"
# testing.append(3)
# testing.prepend(2)
# testing.prepend(4)

# puts " \n--- Testing the #head / #tail functions ---"
# printf "Current head: "; p testing.head
# printf "Current tail: "; p testing.tail
# # p testing.pop
# p testing.tail

# puts " \n--- Tesing the #at function ---"
# index = 0
# printf "node at #{index} : "; p testing.at(index)
# index = 1
# printf "node at #{index} : "; p testing.at(index)
# index = 2
# printf "node at #{index} : "; p testing.at(index)
# index = 3
# printf "node at #{index} : "; p testing.at(index)

# puts " \n--- Testing the #contain? functions ---"
# value_contain = 0
# printf "Linked list containing #{value_contain}: "; p testing.contains?(value_contain)
# value_contain = 3
# printf "Linked list containing #{value_contain}: "; p testing.contains?(value_contain)
# value_contain = 4
# printf "Linked list containing #{value_contain}: "; p testing.contains?(value_contain)

# puts " \n--- Testing the #find functions (4->2->3)---"
# find_value = 0
# printf "Finding #{find_value}: "; p testing.find(find_value)
# find_value = 3
# printf "Finding #{find_value}: "; p testing.find(find_value)
# find_value = 4
# printf "Finding #{find_value}: "; p testing.find(find_value)

# puts " \n--- Testing the #to_s functions (4->2->3)---"
# testing.to_s
