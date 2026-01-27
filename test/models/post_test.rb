require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    # Save to trigger name creation for author
    @published_date = Time.now
    @post = Post.new(title: "A New Post",
                     published: true,
                     tag_ids: [ tags(:two).id, tags(:one).id ],
                     body: ActionText::RichText.new(body: "<h1>This is a test</h1>"),
                     publication_date: @published_date)

    @post_no_publication_date = Post.new(title: "Another new Post",
                                        published: false,
                                        body: ActionText::RichText.new(body: "<h1>This is a test</h1>"))
  end

  test "should create a new post when the post is valid" do
    assert @post.valid?
    assert @post.save
  end

  test "should not validate when post is invalid" do
    assert_not Post.new.valid?
  end

  test "should not validate when title is missing" do
    @post.title = nil
    assert_not @post.valid?
  end

  test "should not validate when body is missing" do
    @post.body = nil
    assert_not @post.valid?
  end

  test "should not allow posts with same title to be created" do
    @post.title = posts(:one).title
    assert_not @post.save
  end

  test "should create a param containing the id and the parameterized slug" do
    @post.save
    assert @post.to_param == "#{@post.id}-#{@post.title.to_s.parameterize}"
  end

  test "should update the post" do
    @post.save
    assert @post.update(title: "This is a new title")
  end

  test "should set the publication date when the published status is changed" do
    @post_no_publication_date.save
    assert_not @post_no_publication_date.publication_date
    @post_no_publication_date.update(published: true)
    assert @post_no_publication_date.publication_date
  end
end
