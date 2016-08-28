class Array
  def accumulate(&instruction)
    self.inject([]) do |new_array, element| 
      new_array << instruction.call(element)
    end
  end
end