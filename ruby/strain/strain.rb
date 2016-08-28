class Array
  def keep(&validation)
    self.inject([]) do |modified_array, element|
      validation.call(element) == true ? modified_array << element : modified_array
    end
  end

  def discard(&validation)
    self.inject([]) do |modified_array, element|
      validation.call(element) == false ? modified_array << element : modified_array
    end
  end
end