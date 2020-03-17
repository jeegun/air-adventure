class Adventure < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :number_of_guests, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :languages, presence: true
  validates :description, presence: true
  validates :name, presence: true, uniqueness: true
end
