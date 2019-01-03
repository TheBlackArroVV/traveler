class MessageSerializer < ActiveModel::Serializer
  attributes(*Message.attribute_names.map(&:to_sym) - %i[created_at updated_at])

  attribute :user_name

  def user_name
    @object.user.email
  end
end
