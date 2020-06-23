class Chatroom < ApplicationRecord
  belongs_to :booking

  has_many :messages
  has_many :users, through: :messages
end
