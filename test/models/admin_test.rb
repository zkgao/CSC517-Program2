require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # end
  def setup
    @admin = Admin.new(email: "24@12414.com" )
  end


  test "email addresses should be unique" do
    duplicate_user = @admin.dup
    @admin.save
    assert_not duplicate_user.valid?
  end

end

