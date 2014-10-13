class Asset < ActiveRecord::Base
  has_and_belongs_to_many :rentals
  validates :asset_tag, :serial_number, uniqueness: true
end
