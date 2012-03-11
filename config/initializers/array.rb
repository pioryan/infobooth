class Array
  def to_hash_keys
    self.reduce({}) do |hash, item|
      hash["#{item}".to_sym] = item
      hash
    end
  end
end