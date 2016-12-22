class Ad < ActiveRecord::Base
  mount_uploaders :photos, PhotoUploader
  belongs_to :user
  validates :category, :condition, :ad_title, :description, :price, presence: true
  validates :item_location, :item_area, :seller_type, :phone_number, presence: true
end