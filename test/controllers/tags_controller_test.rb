require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test "should get index" do
    get tags_url
    assert_response :success
  end

  test "index should only return published posts," do
    @post = posts(:one)
    @post.tags = [ @tag ]
    @post.save
    get tag_url(@tag)
    assert_equal Post.where(published: true).joins(:tags).where(tags: { name: @tag.name }).order(updated_at: :desc).limit(9), assigns(:posts)
  end

  test "should show tag" do
    get tag_url(@tag)
    assert_response :success
  end
end
