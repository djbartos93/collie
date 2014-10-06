class AssetsRentals < ActiveRecord::Base
  belongs_to :asset
  belongs_to :rental
end
