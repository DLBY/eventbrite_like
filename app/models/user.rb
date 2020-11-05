class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :event_admins, foreign_key: 'event_admin_id', class_name: 'Event', dependent: :destroy
  has_many :events
  has_many :events, through: :attendances
  has_many :attendances

  after_create :welcome_send

  has_one_attached :avatar
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end