require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without an email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end

  it "requires a unique email address" do
    existing_user = create(:user, email: "semirem@gmail.com")
    new_user = build(:user, email: "semirem@gmail.com")
    expect(new_user).to_not be_valid
  end
end
