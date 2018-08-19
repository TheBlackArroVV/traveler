class PostSerializer < ActiveModel::Serializer
  attributes(*Post.attribute_names.map(&:to_sym) - %i[created_at updated_at])
end
