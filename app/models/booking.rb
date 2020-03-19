class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :adventure
  has_many :reviews
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :nr_of_booked_guests, presence: true
  validate :end_date_after_start_date
  validate :booked_guests_less_than_max
  before_create :calculate_total_price

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if self.end_date < self.start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def booked_guests_less_than_max
    if nr_of_booked_guests > adventure.number_of_guests
      errors.add(:nr_of_booked_guests, "cannot be more than max")
    end
  end

  def calculate_total_price
    unit_price = self.adventure.price
    nr_of_days = self.end_date.day - self.start_date.day
    nr_of_booked_guests = self.nr_of_booked_guests
    self.total_price = unit_price * nr_of_days * nr_of_booked_guests
  end
end
