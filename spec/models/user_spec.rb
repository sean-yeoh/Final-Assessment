require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "should have name, email, password_digest, photo and role" do
      should have_db_column(:username).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
      should have_db_column(:photo).of_type(:string)
      should have_db_column(:role).of_type(:integer)
    end

    describe "validates presence and uniqueness of name and email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:username) }
      it { is_expected.to validate_uniqueness_of(:email) }
      it { is_expected.to validate_uniqueness_of(:username) }
    end

    describe "validates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_presence_of(:password_confirmation) }
      it { is_expected.to validate_length_of(:password).is_at_least(4).is_at_most(20) }
      it { is_expected.to validate_confirmation_of(:password) }
    end
  end

  context 'associations with dependency' do
    it { is_expected.to have_many(:authentications).dependent(:destroy)}
    it { is_expected.to have_many(:ads).dependent(:destroy)}
  end

  let(:username) { "testing" }
  let(:email) { "testing@email.com" }
  let(:password) { "1234" }
  let(:password_confirmation) { "1234" }
  let(:test) { User.new(username: username, email: email, password: password, password_confirmation: password_confirmation) }

   # happy_path
  describe "can be created when all attributes are present and valid" do

    it "saves the user" do
      expect(test).to be_valid
    end

    it "increase user db count by 1" do
      user_db_count = User.count
      test.save
      expect(User.count).to eq(user_db_count+1)
    end
  end

  #unhappy_path
  describe "cannot be created when some attributes are missing or invalid" do
    it "cannot be created without a username" do
      invalid_user = User.create(email: "test@email.com", password: "1234", password_confirmation: '1234')
      expect(invalid_user).to_not be_valid
    end

    it "cannot be created without a email" do
      invalid_user = User.create(username: 'test', password: "1234", password_confirmation: '1234')
      expect(invalid_user).to_not be_valid
    end

    it "cannot be created without a password" do
      invalid_user = User.create(username: 'test', email: "test@email.com", password_confirmation: "1234")
      expect(invalid_user).to_not be_valid
    end

    it "cannot be created without a password confirmation" do
      invalid_user = User.create(username: 'test', email: "test@email.com", password: "1234")
      expect(invalid_user).to_not be_valid
    end

    it "cannot be created when password does not match" do
      invalid_user = User.create(username: 'test', email: "test@email.com", password: "1234", password_confirmation: "12345")
      expect(invalid_user).to_not be_valid
    end

    it "cannot be created when password length less than 4" do
      invalid_user = User.create(username: 'test', email: "test@email.com", password: "123", password_confirmation: "123")
      expect(invalid_user).to_not be_valid
    end

    it "cannot be created with email that has been taken" do
      valid_user = User.create(username: "valid", email: "test@email.com", password: "1234", password_confirmation: '1234')
      invalid_user = User.create(username: "invalid", email: "test@email.com", password: "1234", password_confirmation: '1234')
      expect(invalid_user).to_not be_valid
    end

    it "cannot be created with username that has been taken" do
      valid_user = User.create(username: "test", email: "valid@email.com", password: "1234", password_confirmation: '1234')
      invalid_user = User.create(username: "test", email: "invalid@email.com", password: "1234", password_confirmation: '1234')
      expect(invalid_user).to_not be_valid
    end
  end
end

