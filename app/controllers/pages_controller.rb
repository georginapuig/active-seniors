class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @offers = Offer.all
    @offers = Offer.all.shuffle.first(6)
  end
end
