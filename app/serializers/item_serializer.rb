class ItemSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name
end
