class BookingsController < ApplicationController
  before_action :set_offer, only: [:new, :create]

  def index
    @bookings = Booking.all.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
    @offer = @booking.offer
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.offer = @offer
    @booking.user = current_user

    if @booking.save
      # UserMailer.booking_confirmation(@booking).deliver_now
      redirect_to new_booking_checkout_path(@booking)
    else
      render 'offers/show'
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
