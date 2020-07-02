class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  has_many :reviews
  has_many :messages
  has_many :users, through: :messages

  validates :start_date, :end_date, presence: true
  # validates :end_date_after_start_date

  # private

  # def end_date_after_start_date
  #   return if end_date.blank? || start_date.blank?

  # if end_date < start_date
  #   errors.add(:end_date, "must be after the start date")
  # end
  # end
end
