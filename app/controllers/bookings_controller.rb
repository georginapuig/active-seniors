class BookingsController < ApplicationController
  def index
  end

  def create
    if @booking.save
      UserMailer.booking_confirmation(@booking).deliver_now      
    end
  end
end
