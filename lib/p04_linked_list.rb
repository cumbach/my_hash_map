require 'byebug'
class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    current_link = @head
    next_link = current_link.next
    until next_link.nil?
      current_link = next_link
      next_link = current_link.next
    end
    current_link
  end

  def empty?
    @head.nil?
  end

  def get(key)
    return @head.val if @head.key == key
    next_link = @head.next
    until next_link.nil?
      if next_link.key == key
        return next_link.val
      end
      next_link = next_link.next
    end
    nil
  end

  def include?(key)
    return true if @head.key == key
    current_link = @head
    next_link = @head.next
    until next_link.nil?
      return true if current_link.key == key
      current_link = next_link
      next_link = current_link.next
    end
    false
  end

  def insert(key, val)
    # debugger
    new_link = Link.new(key, val)
    last.next = new_link
  end

  def remove(key)
    current_link = @head
    next_link = current_link.next
    until next_link.nil?
      if next_link.key == key
        current_link.next = next_link.next
      end
      current_link = next_link
      next_link = current_link.next
    end
    nil
  end

  def each(&blk)
    p self
    current_link = @head
    next_link = current_link.next
    until next_link.nil?
      blk.call(next_link)
      current_link = next_link
      next_link = current_link.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

list = LinkedList.new
list.insert(:first, 1)
list.insert(:second, 2)
list.insert(:third, 3)

list.get(:first)
list.get(:second)
list.get(:third)
