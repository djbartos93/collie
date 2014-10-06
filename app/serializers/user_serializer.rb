class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :org, :external_id, :active
end
