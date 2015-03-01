class Asset < ActiveRecord::Base
  searchkick
  has_and_belongs_to_many :rentals
  has_and_belongs_to_many :types
  has_many :asset_tags
  belongs_to :manufacturer
  belongs_to :state

  after_create :generate_asset_tag

  validates :serial_number, uniqueness: true

  def current_tag
    asset_tags.all.order("created_at DESC").first
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |asset|
        csv << asset.attributes.values_at(*column_names)
      end
    end
  end

  def search_data
    attributes.merge asset_tag: current_tag.tag_number
  end

  private

  def generate_asset_tag
    self.asset_tags.create
  end
end
