class Offer < ApplicationRecord
  belongs_to :category, :class_name => "Category"
  belongs_to :subcategory, :class_name => "Category"
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :photo
end
