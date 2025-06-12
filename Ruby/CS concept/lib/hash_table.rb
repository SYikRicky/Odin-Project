require_relative 'linked_list'

# raise IndexError if index.negative? || index >= @buckets.length

class HashMap
  LOAD_FACTOR = 0.8

  def initialize
    @hash_table = Array.new(CAPACITY)
    @capacity = 16
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    return hash_code
  end
  
  def set(key, value)
    index = get_bucket_index(key)
    if @hash_table[index] == nil 
      @hash_table[index] = LinkedList.new(value)
    else
      @hash_table[index].prepend(value)
    end


  end

  def get(key)
    index = get_bucket_index(key)

    if @hash_table[index] != nil
      return @hash_table[index].at(0)
    end

    return nil
  end

  def has?(key)
    index = get_bucket_index(key)

    if @hash_table[index] != nil
      return true
    end
  
    return false
  end

  def remove(key)
    index = get_bucket_index(key)
  end

  def length
    
  end

  def clear
    
  end

  def keys
    
  end

  def entires
    
  end

  private

  def get_bucket_index(key)
    return hash(key) % CAPACITY
  end

  def grow_buckets_size
    @capacity *= 2
  end

end