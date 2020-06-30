class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :offers
  has_many :reviews
  has_many :bookings
  has_many :messages
  has_many :chatrooms, through: :messages

  private

  # delivering the email from model (on callback)
  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end

# rails g migration AddUsernameToUsers