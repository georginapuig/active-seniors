class Offer < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :location ],
    using: {
      tsearch: { prefix: true }
  }
  belongs_to :category, :class_name => "Category"
  belongs_to :subcategory, :class_name => "Category"
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :photo

    has_many :bookings
    has_many :reviews, through: :bookings
end
