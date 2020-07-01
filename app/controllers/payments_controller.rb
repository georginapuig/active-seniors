class PaymentsController < ApplicationController
  def new
    @checkout = Checkout.find(params[:checkout_id])
  end

  def success
  end

  def cancel
  end
end
