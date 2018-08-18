class ProfileForm
  attr_accessor :errors

  def initialize(params)
    self.params = params
    self.errors = []
  end

  def save
    profile = Profile.new(params)
    if profile.save
      true
    else
      @errors = profile.errors
      false
    end
  end
end
