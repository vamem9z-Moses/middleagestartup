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

  test "index should only return published posts," do
    get posts_url
    assert_equal Post.where(published: true).order(updated_at: :desc).limit(9), assigns(:posts)
  end

  test "should show the post" do
    get post_url(@post)
    assert_response :success
  end
end
