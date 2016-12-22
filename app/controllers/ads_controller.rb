class AdsController < ApplicationController
  def index
  end

  def new
    @ad = Ad.new
    @categories = Ad.order(:id).pluck(:category).uniq
    @locations = Ad.uniq.pluck(:item_location).sort
  end

  def create
    @ad = current_user.ads.new(ad_params)
    if @ad.save
      redirect_to @ad
    else
      @categories = Ad.order(:id).pluck(:category).uniq
      @locations = Ad.uniq.pluck(:item_location).sort
      redirect_to new_ad_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def ad_params
    params.require(:ad).permit(:category, {photos: []}, :condition, :ad_title, :description, :price, :item_location, :item_area, :seller_type, :phone_number)
  end
end