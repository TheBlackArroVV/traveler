class ProfileForm
  include ActiveModel::Model

  attr_accessor :user_id, :about, :avatar

  def initialize(params)
    self.user_id = params[:user_id]
    self.about = params[:about]
    self.avatar = params[:avatar]
  end

  def save
    return false unless valid?
    Profile.create(user_id: user_id, about: about)
    true
  end
end