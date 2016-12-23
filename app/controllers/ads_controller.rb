class AdsController < ApplicationController
  def index
    @ads = Ad.paginate(:page => params[:page], :per_page => 10).where(nil)
    @categories = Ad.order(:id).pluck(:category).uniq.sort
    @locations = Ad.pluck(:item_location).uniq.sort
    search_params(params).each do |key, value|
      @ads = @ads.public_send(key, value) if value.present?
    end
  end

  def new
    @ad = Ad.new
    @categories = Ad.order(:id).pluck(:category).uniq.sort
    @locations = Ad.pluck(:item_location).uniq.sort
  end

  def create
    @ad = current_user.ads.new(ad_params)
    respond_to do |format|
      if @ad.save
        format.js { redirect_to ad_path(@ad) }
      else
        format.html { render 'ads/new' }
        format.js
      end
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def edit
    @ad = Ad.find(params[:id])
    @categories = Ad.order(:id).pluck(:category).uniq.sort
    @locations = Ad.pluck(:item_location).uniq.sort
    unless current_user == @ad.user || current_user.admin?
      redirect_to @ad
    end
  end

  def update
    @ad = Ad.find(params[:id])
    respond_to do |format|
      if @ad.update(ad_params)
        format.js { redirect_to ad_path(@ad) }
      else
        format.html { render 'ads/new' }
        format.js
      end
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    unless current_user == @ad.user || current_user.admin?
      redirect_to @ad
    else
      @ad.destroy
      redirect_to ads_path
    end
  end

  private
  def ad_params
    params.require(:ad).permit(:category, {photos: []}, :condition, :ad_title, :description, :price, :item_location, :item_area, :seller_type, :phone_number)
  end

  def search_params(params)
    params.slice(:category, :condition, :item_location, :min_price, :max_price, :ad_title)
  end
end