class CheckoutsController < ApplicationController
  def new
    @checkout = Checkout.new
    @booking = Booking.find(params[:booking_id])
    @hours = (@booking.end_date - @booking.start_date) / 3600
    @subtotal = @hours * @booking.offer.price
    @vat = @subtotal * 0.2
    @grand_total = @subtotal + @vat
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @checkout = Checkout.create!(offer_id: @booking.offer.id, amount: @booking.offer.price_cents, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name:   @booking.id,
        images: [@booking.offer.user.photo],
        amount: @booking.offer.price_cents,
        currency: 'usd',
        quantity: 1
      }],
      success_url: payments_success_url,
      cancel_url:  payments_cancel_url
    )

    @checkout.update(checkout_session_id: session.id)
    redirect_to new_booking_checkout_payment_path(@booking, @checkout)
  end

  def show
    @checkout = current_user.checkouts.find(params[:id])
  end

  private

  def checkout_params
    params.require(:checkout).permit(:user_id, :offer_id, :checkout_session_id, :amount_currency, :amount_cents, :state)
  end
end
