class ETL
  def self.transform(input)
    input.each_pair.inject({}) do |transformed, (key, val)|
      add_transformed_score(transformed, val, key)
    end
  end

  private
    def self.add_transformed_score(transformed_hash, new_keys, new_value)
      new_keys.each { |key| transformed_hash[key.downcase] = new_value }
      transformed_hash
    end
end