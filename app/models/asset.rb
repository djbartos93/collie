class Asset < ActiveRecord::Base
  has_and_belongs_to_many :rentals
end
