class Asset < ActiveRecord::Base
  has_and_belongs_to_many :rentals
  has_many :asset_tags

  after_create :generate_asset_tag

  validates :serial_number, uniqueness: true

  def current_tag
    self.asset_tags.all.order("created_at DESC").first
  end

  private
    def generate_asset_tag
      self.asset_tags.create
    end
end
