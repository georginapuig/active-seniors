class CheckoutsController < ApplicationController
  def new
    @checkout = Checkout.new
    @booking = Booking.find(params[:booking_id])
    @hours = (@booking.end_date - @booking.start_date) / 3600
    # @subtotal =
    # @vat =
    # @grand_total =
  end

  def create
    offer = Offer.find(params[:offer_id])
    checkout = Checkout.create!(offer: offer, offer_id: offer.id, amount: offer.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: offer.id,
        images: [offer.photo_url],
        amount: offer.price_cents,
        currency: 'usd',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to payment_path(checkout)
  end

  def show
    @checkout = Checkout.find(params[:id])
  end

  private

  def checkout_params
    params.require(:checkout).permit(:user_id, :offer_id, :checkout_session_id, :amount_currency, :amount_cents, :state)
  end
end
