require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



  test "find user cat by user id" do
    user = users(:seller_user)
    cats = Category.find_seller_category(user.id)
    assert cats.size == 2
    cats.each do |cat|
      assert ['meat','fruit'].include? cat.name
    end
  end




end
