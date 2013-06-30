require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user must enter a first name" do
     user = User.new
     assert !user.save
     assert !user.errors[:first_name].empty?
  end
  test "user must enter a last name" do
     user = User.new
     assert !user.save
     assert !user.errors[:last_name].empty?
  end
  test "user must enter a profile name" do
     user = User.new
     assert !user.save
     assert !user.errors[:profile_name].empty?
  end
  test "user must enter a unique profile name" do
     user = User.new
     user.profile_name = users(:colin).profile_name
     
     assert !user.save
     assert !user.errors[:profile_name].empty?
  end
  test "user must enter a unique profile name without spaces" do
     user = User.new
     user.profile_name = "Profile with spaces"
     
     assert !user.save
     assert !user.errors[:profile_name].empty?
     assert user.errors[:profile_name].include?("Must be formatted correctly")
  end
end
