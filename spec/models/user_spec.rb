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
    existing_user = User.create(email: "semirem@gmail.com", password: "carshy1234")
    new_user = User.new(email: "semirem@gmail.com", password: "carshy123")
    expect(new_user).to_not be_valid
  end

  it "encrypts password before saving" do
    user = User.create(email: "encrypt@gmail.com", password: "carshy1234")
  
    # Reload the user from the database to ensure you're working with the persisted version
    user_from_db = User.find(user.id)
  
    # Check if the stored password matches the plain text password
    expect(user_from_db.password).to_not eq("carshy1234")
  end
end
