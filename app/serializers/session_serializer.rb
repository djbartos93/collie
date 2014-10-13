class SessionSerializer < ActiveModel::Serializer
  attributes :id, :new, :create, :destroy
end
