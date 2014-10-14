class User < ActiveRecord::Base
  ROLES = %i(admin manager renter)
  has_secure_password

  before_validation :set_role

  validates :email, :org, :role, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /@/ }

  private
    def set_role
      self.role = 'renter' unless self.role
    end
end
