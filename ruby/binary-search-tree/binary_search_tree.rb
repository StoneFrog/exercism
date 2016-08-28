class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end

  def insert(num)
    case
    when num <= data
      insert_left(num)
    else
      insert_right(num)
    end
  end

  def each(&block)
    left.each(&block) unless left.nil?
    block.call(data)
    right.each(&block) unless right.nil?
  end

  private
    def insert_left(num)
      left.nil? ? self.left = Bst.new(num) : left.insert(num)
    end

    def insert_right(num)
      right.nil? ? self.right = Bst.new(num) : right.insert(num)
    end
end