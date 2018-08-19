class UserSerializer < ActiveModel::Serializer
  attributes(*User.attribute_names.map(&:to_sym) - %i[created_at updated_at])
end
