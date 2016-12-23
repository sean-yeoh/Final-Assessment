require 'rails_helper'

RSpec.describe Ad, type: :model do
  context "validations" do
    it "should have category, condition, title, description, price, item_location,
        item_area, seller_type, phone_number, photos and user_id" do
      should have_db_column(:category).of_type(:string)
      should have_db_column(:condition).of_type(:string)
      should have_db_column(:ad_title).of_type(:string)
      should have_db_column(:description).of_type(:text)
      should have_db_column(:price).of_type(:decimal)
      should have_db_column(:item_location).of_type(:string)
      should have_db_column(:item_area).of_type(:string)
      should have_db_column(:seller_type).of_type(:string)
      should have_db_column(:phone_number).of_type(:string)
      should have_db_column(:photos).of_type(:json)
      should have_db_column(:user_id).of_type(:integer)
    end

    describe "validates presence of" do
      it { is_expected.to validate_presence_of(:category) }
      it { is_expected.to validate_presence_of(:condition) }
      it { is_expected.to validate_presence_of(:ad_title) }
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:item_location) }
      it { is_expected.to validate_presence_of(:item_area) }
      it { is_expected.to validate_presence_of(:seller_type) }
      it { is_expected.to validate_presence_of(:phone_number) }
    end
  end

  context "associations" do
    it { is_expected.to belong_to(:user) }
  end

  # happy_path
  describe "can be created when all attributes are present and valid" do
    let(:ad) {
      Ad.new(
        category: "Vehicles",
        condition: "New",
        ad_title: 'Want to sell my car',
        description: 'Please buy',
        price: 10000,
        item_location: 'Selangor',
        item_area: 'Damansara',
        seller_type: 'Private Seller',
        phone_number: '0123456789'
      )
    }

    it "saves the ad" do
      expect(ad).to be_valid
    end

    it "increase ad db count by 1" do
      ad_db_count = Ad.count
      ad.save
      expect(Ad.count).to eq(ad_db_count+1)
    end
  end

  # unhappy_path
  describe "cannot be created when some attributes are missing or invalid" do
    it "cannot be created without a some attributes" do
      invalid_ad = Ad.create(
        ad_title: 'Want to sell my car',
        description: 'Please buy',
        price: 10000,
        item_location: 'Selangor'
      )
      expect(invalid_ad).to_not be_valid
    end
  end

  context 'most recent ad showed first' do
    it 'retrieves the most recent ad first' do
      ad_1 = Ad.create(
        category: "Vehicles",
        condition: "New",
        ad_title: 'Want to sell my car',
        description: 'Please buy',
        price: 10000,
        item_location: 'Selangor',
        item_area: 'Damansara',
        seller_type: 'Private Seller',
        phone_number: '0123456789'
        )

      ad_2 = Ad.create(
        category: "Electronics",
        condition: "Used",
        ad_title: 'Want to sell my iphone',
        description: 'Used iphone 6, want to change to iphone 7',
        price: 10000,
        item_location: 'Selangor',
        item_area: 'Bandar Utama',
        seller_type: 'Private Seller',
        phone_number: '0123456789',
        created_at: Time.now + 1.hour
        )
      expect(Ad.first).to eq(ad_2)
    end
  end
end
