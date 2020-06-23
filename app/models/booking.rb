class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  has_many :reviews
  has_many :chatrooms
end
