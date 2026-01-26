require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post.save
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should show the post" do
    get post_url(@post)
    assert_response :success
  end
end
