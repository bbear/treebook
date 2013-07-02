require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "user must enter content" do
     status = Status.new
     assert !status.save
     assert !status.errors[:content].empty?
  end
  test "user must enter content of at least 2 characters" do
     status = Status.new
     status.content = "H"
     assert !status.save
     assert !status.errors[:content].empty?
  end
  test "user must be associated to status" do
     status = Status.new
     status.content = "Hellow"
     assert !status.save
     assert !status.errors[:user_id].empty?
  end
end
