class ProfileForm
  attr_accessor :user_id, :about, :avatar, :errors

  def initialize(params)
    self.user_id = params[:user_id]
    self.about = params[:about]
    self.avatar = params[:avatar]
    self.errors = []
  end

  def save
    profile = Profile.new(user_id: user_id, about: about)
    if profile.save
      true
    else
      errors.push(profile.errors)
      false
    end
  end
end
