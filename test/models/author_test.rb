require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  setup do
    @author = Author.new(first_name: "Moses", last_name: "Miles",
                        email: "vamem9z@gmail.com", blurb: "This is test blurb")
    @author.avatar.attach(io: File.open(Rails.root.join("test", "fixtures", "files", "cprpo.jpg")),
                        filename: "cprpo.jpg",
                        content_type: "image/jpeg",
                        identify: false)
  end

  test "should create a new author when the conditions are valid" do
    assert @author.valid?
    assert @author.save
  end

  test "should raise NoMethodError when first_name is missing" do
    @author.first_name = nil
    assert_raises(NoMethodError) do
      @author.valid?
    end
  end

  test "should raise NoMethodError when last_name is missing" do
    @author.last_name = nil
    assert_raises(TypeError) do
      @author.valid?
    end
  end

  test "should not validate when email is missing" do
    @author.email = nil
    assert_not @author.valid?
  end

  test "should not validate when email is not valid" do
    @author.email = "This is not an email"
    assert_not @author.valid?
  end

  test "should not validate when blurb is not valid" do
    @author.blurb = nil
    assert_not @author.valid?
  end

  test "should deleve author when destroyd" do
    @author.save
    assert_difference("Author.count", -1) do
      @author.destroy
    end
  end
end
