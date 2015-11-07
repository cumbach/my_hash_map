class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 752 if empty?
    result = []
    each_with_index do |el, i|
        result << (el ^ i)
    end
    result.empty? ? 752 : result.inject(:+)
  end
end

class String
  def hash
    result = []
    split("").each_with_index do |el, i|
        result << (el.ord ^ i)
    end
    result.empty? ? 752 : result.inject(:+)
  end
end

class Hash
  def hash
    keys = self.keys.sort.map(&:to_s).map(&:hash)
    values = self.values.sort.map(&:to_s).map(&:hash)
    (keys + values).inject(:+)
  end
end
