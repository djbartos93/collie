class Settings::RentableAssetType < Setting
  validates :int_value, numericality: true

  def self.get
    first || create!(int_value: 0)
  end

  def rentable_asset_type()
    int_value
  end

  def rentable_asset_type=(type)
    self.int_value = type.id if type.is_a? Type
    self.int_value = type if type.is_a? Integer
    self.int_value = type.to_i if type.is_a? String
  end
end
