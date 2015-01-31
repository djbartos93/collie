class AssetTag < ActiveRecord::Base
  searchkick
  belongs_to :asset
  validates :tag_number, uniqueness: true

  before_create :generate_tag_number

  def print_label
    tag_data = ZPL.generate_asset_tag(tag_number)
    if CONFIG[:LABEL_PRINTING][:ENABLED]
      PRINT_EXCHANGE.publish tag_data, :routing_key => "print_queue"
    end
  end

  private

  def generate_tag_number
    begin
      self.tag_number = SecureRandom.base64(12)
    end while self.class.exists?(tag_number: tag_number)
  end
end
