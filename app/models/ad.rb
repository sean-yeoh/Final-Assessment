class Ad < ActiveRecord::Base
  mount_uploaders :photos, PhotoUploader
  belongs_to :user
  validates :category, :condition, :ad_title, :description, :price, presence: true
  validates :item_location, :item_area, :seller_type, :phone_number, presence: true
  default_scope {order(created_at: :desc)}

  scope :category, -> (category) { where category: category }
  scope :condition, -> (condition) { where condition: condition }
  scope :item_location, -> (item_location) { where item_location: item_location }
  scope :min_price, ->(min_price) { where("price >= ?", min_price) }
  scope :max_price, ->(max_price) { where("price <= ?", max_price) }
  scope :ad_title, -> (ad_title) { where("ad_title ILIKE ?", "%#{ad_title}%") }

end