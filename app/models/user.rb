class User < ActiveRecord::Base
  has_secure_password
  has_many :authentications, :dependent => :destroy
  has_many :ads, :dependent => :destroy
  mount_uploader :photo, PhotoUploader
  validates :email, uniqueness: true, presence: true, format: { with: /.+@.+\..+/i }
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, length: { in: 4..20 }, on: :create
  validates :password_confirmation, presence: true, on: :create

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.password = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).sample(rand(8..10)).join
      u.password_confirmation = u.password
      u.username = auth_hash["extra"]["raw_info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
      u.remote_photo_url = auth_hash["info"]["image"].gsub('http://','https://')
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  enum role: [:user, :admin]
end