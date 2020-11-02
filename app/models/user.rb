class User < ApplicationRecord
  after_create :welcome_send

  has_many :events
  has_many :events, through: :attendances
  has_many :attendances

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end
