class AssetTag < ActiveRecord::Base
  belongs_to :asset
  validates :tag_number, uniqueness: true

  before_create :generate_tag_number

  private
    def generate_tag_number
      begin
        self.tag_number = SecureRandom.base64(12)
      end while self.class.exists?(tag_number: tag_number)
    end
end
