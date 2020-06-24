class Offer < ApplicationRecord
  belongs_to :category, :class_name => "Category"
  belongs_to :subcategory, :class_name => "Category"
  belongs_to :user

  has_one_attached :photo
end
