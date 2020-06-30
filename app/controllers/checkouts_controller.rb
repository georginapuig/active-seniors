class CheckoutsController < ApplicationController
  def new
    @checkout = Checkout.new
  end

  def show
    @checkout = Checkout.find(partams[:id])
  end
end
