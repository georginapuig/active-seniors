class CheckoutsController < ApplicationController
  def new
    @checkout = Checkout.new
    @booking = Booking.find(params[:booking_id])
    @hours = (@booking.end_date - @booking.start_date) / 3600
  end

  def create
    @checkout = Checkout.new(checkout_params)
    if @checkout.save
      redirect_to payment_path
    else
      render new
    end
  end

  def show
    @checkout = Checkout.find(params[:id])
  end

  private

  def checkout_params
    params.require(:checkout).permit(:user_id, :offer_id, :checkout_session_id, :amount_currency, :amount_cents, :state)
  end
end
