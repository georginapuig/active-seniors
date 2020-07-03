class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    location = params[:location]
    categ = params[:category]
    subcateg = params[:subcategory]
    category = params[:q]
    if location.present?
      result = Offer.search_by_location(params[:location])
      if categ.present?
        if subcateg.present?
          @offers = result.where(subcategory_id: subcateg.to_i)
        else
          @offers = result.where(category_id: categ.to_i)
        end
      else
        #@offers = result
        if subcateg.present?
          @offers = result.where(subcategory_id: subcateg.to_i)
        else
          @offers = result
        end
      end
      @markers = @offers.map do |offer|
        {
          lat: offer.latitude,
          lng: offer.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { offer: offer }),
          image_url: helpers.asset_url('pin.png')
        }
      end
    elsif category.present?
      id = Category.where(name: "#{category}").first.id
      @offers = Offer.where(category_id: id).geocoded.shuffle

      @markers = @offers.map do |offer|
        {
          lat: offer.latitude,
          lng: offer.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { offer: offer }),
          image_url: helpers.asset_url('pin.png')
        }
      end
    else
      #@offers = Offer.all.geocoded.shuffle
      if categ.present?
        if subcateg.present?
          @offers = Offer.where(subcategory_id: subcateg.to_i)
        else
          @offers = Offer.where(category_id: categ.to_i)
        end
      else
        #@offers = result
        if subcateg.present?
          @offers = Offer.where(subcategory_id: subcateg.to_i)
        else
          @offers = Offer.all.geocoded.shuffle
        end
      end

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
    @review = Review.new

    if params[:lat] && params[:lng]
      @offers = Offer.near([params[:lat], params[:lng]], 5).first(6)
      if @offers.size == 0
        @offers = Offer.all.shuffle.first(6)
      end
    else
      @offers = Offer.all.shuffle.first(6)
    end

    @marker = {
      lat: @offer.latitude,
      lng: @offer.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { offer: @offer }),
      image_url: helpers.asset_url('pin.png')
    }
    parsed_marker = @marker.to_json
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
