class User < ActiveRecord::Base
  ROLES = %i(admin manager renter)
  has_secure_password

  before_validation :set_role
  before_create :generate_confirm_key

  validates :email, :org, :role, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /@/ }

  private
    def set_role
      self.role = 'renter' unless self.role
    end

    def generate_confirm_key
      begin
        self.confirm_key = SecureRandom.hex
      end while self.class.exists?(confirm_key: confirm_key)
    end
end
