class Review < ApplicationRecord
  belongs_to :offer

  validates :rating, presence: true
end
