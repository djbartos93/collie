class Asset < ActiveRecord::Base
  searchkick
  has_and_belongs_to_many :rentals
  has_and_belongs_to_many :types
  has_many :asset_tags
  belongs_to :manufacturer
  belongs_to :state

  after_commit :reindex_product
  after_create :generate_asset_tag

  validates :serial_number, uniqueness: true

  scope :rentable, -> { includes(:types).where(types: { id: Settings::RentableAssetType.get.rentable_asset_type }) }

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
    search_attributes = attributes
    search_attributes = search_attributes.merge asset_tag: current_tag.tag_number
    search_attributes = search_attributes.merge manufacturer: manufacturer.name if manufacturer
    search_attributes = search_attributes.merge state: state.name if state
    search_attributes = search_attributes.merge types: types.to_a if types
    search_attributes
  end

  private

  def generate_asset_tag
    self.asset_tags.create
  end

  def reindex_product
    reindex
  end
end
