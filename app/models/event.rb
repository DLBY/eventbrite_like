class Event < ApplicationRecord
  
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user, optional: true
  
  validates :start_date, presence: true#if start_date < Time.now, 

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }#if :duration % 5 == 0, 

  validates :title, presence: true, length: { in: 3..140}

  validates :description, presence: true, length: { in: 5..240}

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}

  validates :location, presence: true

end
