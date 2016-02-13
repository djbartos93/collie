class JobSerializer < ActiveModel::Serializer
  attributes :id, :progect, :box_number, :wire_number, :start_foot, :end_foot, :pulled_length, :jack_lock, :item_id, :qty_used
end
