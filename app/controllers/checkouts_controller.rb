class CheckoutsController < ApplicationController
  def new
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkout_params)

  end

  def show
    @checkout = Checkout.find(params[:id])
  end

  private

  def checkout_params
    params.require(:checkout).permit()
  end
end
