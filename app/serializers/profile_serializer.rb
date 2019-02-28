class ProfileSerializer < ActiveModel::Serializer
  attributes(*Profile.attribute_names.map(&:to_sym) - %i[created_at updated_at])
  attribute :admin

  def admin
    @object.user.admin
  end
end
