class ProfileForm
  include Virtus.model
  include ActiveModel::Model

  attribute :about, String
  attribute :avatar, String
  attribute :user_id, Integer

  validates :user_id, presence: true

  attr_accessor :profile

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    ApplicationRecord.transaction do
      @profile = Profile.find_by(user_id: user_id)
      @profile.update(user_id: user_id, about: about, avatar: avatar)
    end
  end
end
