class Adventure < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_one_attached :photo
  validates :number_of_guests, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :languages, presence: true
  validates :description, presence: true
  validates :name, presence: true, uniqueness: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :location ],
    associated_against: {
      user: [ :email ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
