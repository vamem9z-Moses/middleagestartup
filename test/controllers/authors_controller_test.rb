require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get authors_url
    assert_response :success
  end

  test "index should only return published posts" do
    get author_url(@author)
    assert_equal Post.where(author: @author, published: true).order(updated_at: :desc).limit(9), assigns(:posts)
  end

  test "should get show" do
    get author_url(@author)
    assert_response :success
  end
end
