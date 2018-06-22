class ProfileForm
  include ActiveModel::Model

  attr_accessor :user_id

  def initialize(params)
    self.user_id = params[:user_id]
  end

  def save
    return false unless valid?
    Profile.create(user_id: user_id)
    true
  end
end