class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    filter = params[:location]
    if filter.present?
      #@offers = Offer.geocoded.shuffle
      @offers = Offer.search_by_location(params[:location])
      @markers = @offers.map do |offer|
        {
          lat: offer.latitude,
          lng: offer.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { offer: offer }),
          image_url: helpers.asset_url('pin.png')
        }
      end
    else
      id = Category.where(name: "#{filter}").first.id
      @offers = Offer.where(category_id: id).geocoded.shuffle

      @markers = @offers.map do |offer|
        {
          lat: offer.latitude,
          lng: offer.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { offer: offer }),
          image_url: helpers.asset_url('pin.png')
        }
      end
    end
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    @offer.user = current_user
    
    if @offer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @offer.update(offer_params)
  end

  def delete
    @offer.destroy
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:description, :location, :price, :photo, :category_id, :subcategory_id, :user_id)
  end
end
