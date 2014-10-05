class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :org, :password_digest, :tech_id, :active
end
