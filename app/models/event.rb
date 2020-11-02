class Event < ApplicationRecord
  belongs_to :users, through: :attendances
  has_many :attendances

  validates :start_date, presence: true, if start_date < Time.now
  validates :duration, presence: true, numericality: { greater_than: 0 }, if :duration % 5 == 0
  validates :title, presence: true, length: { in: 5..140}
  validates :description, presence: true, length: { in: 20..100}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  validates :location, presence: true

end
