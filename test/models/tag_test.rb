require "test_helper"

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = tags(:one)
  end

  test "should create a new tag when the tag is valid" do
    assert @tag.valid?
    assert @tag.save
  end

  test "should not create a new tag when the tag is invalid"  do
    assert_not Tag.new.valid?
  end

  test "should not create a new tag when the name is not unique" do
    name = @tag.name
    assert_not Tag.new(name: name).save
  end

  test "should destroy tag" do
    assert_difference("Tag.count", -1) do
      @tag.destroy
    end
  end
end
