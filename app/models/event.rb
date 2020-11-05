class Event < ApplicationRecord
  
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :user, optional: true
  belongs_to :event_admin, class_name: 'User', optional: true
  
  validates :start_date, presence: true
  validate :is_future?

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :divisable_by_five? 

  validates :title, presence: true, length: { in: 3..140}

  validates :description, presence: true, length: { in: 5..240}

  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}

  validates :location, presence: true
  private

  has_one_attached :event_picture

  def is_future?
    if start_date != nil
      if Time.now > start_date
        errors.add(:start_date, "date de départ peut pas être passée !")
      end
    end
    end

  def divisable_by_five?
    if duration != nil
      if duration % 5 != 0
        errors.add(:duration, "durée doit être multiple de 5")
      end
    end
    end

end
