class User < ApplicationRecord
  has_many :events
  has_many :events, through: :attendances
  has_many :attendances
end
