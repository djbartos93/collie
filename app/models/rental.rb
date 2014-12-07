class Rental < ActiveRecord::Base
  searchkick
  belongs_to :user
  has_and_belongs_to_many :assets
end
