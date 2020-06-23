class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  has_many :reviews
  has_many :bookings
  has_many :messages
  has_many :chatrooms, through: :messages
end

# rails g migration AddUsernameToUsers