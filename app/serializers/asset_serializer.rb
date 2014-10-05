class AssetSerializer < ActiveModel::Serializer
  attributes :id, :asset_tag, :asset_name, :serial_number, :purchase_date, :cost, :status, :notes
end
