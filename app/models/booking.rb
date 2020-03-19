class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :adventure
  validates :start_date, :end_date, presence: true
  validates :nr_of_booked_guests, presence: true
  validate :end_date_after_start_date
  validate :booked_guests_less_than_max

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def booked_guests_less_than_max
    if nr_of_booked_guests > adventure.number_of_guests
      errors.add(:nr_of_booked_guests, "cannot be more than max")
    end
  end
end
