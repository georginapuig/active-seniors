class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  has_many :chatrooms
end
