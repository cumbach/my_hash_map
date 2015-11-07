# require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    self[key.hash] << key.hash unless include?(key.hash)
    @count += 1
  end

  def include?(key)
    self[key.hash].include?(key.hash)
  end

  def remove(key)
    resize! if @count == num_buckets
    self[key.hash].delete(key.hash)
    @count -= 1
  end

  private

  def [](key)
    index = key.hash % num_buckets
    @store[index]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    (@store.length).times do
      @store << []
    end
    @store.each do |bucket|
      bucket.each do |el|
        remove(el)
        insert(el)
      end
    end
  end
end
