require "test_helper"

class FeaturedImageTest < ActiveSupport::TestCase
  setup do
    @featured_image = FeaturedImage.new(name: "The new featured image",
                                    alt_text: "A featured image")
    @featured_image.image.attach(io: File.open(Rails.root.join("test", "fixtures", "files", "cprpo.jpg")),
                        filename: "cprpo.jpg",
                        content_type: "image/jpeg",
                        identify: false)
  end

  test "should create a new featured image when the featured image is valid" do
    assert @featured_image.valid?
    assert @featured_image.save
  end

  test "should not create new featured image when the featured image is invalid" do
    assert_not FeaturedImage.new.valid?
  end

  test "should not create new featured image when the name is missing" do
    @featured_image.name = nil
    assert_not @featured_image.save
  end

  test "should not create new featured image when the alt_text is missing" do
    @featured_image.alt_text = nil
    assert_not @featured_image.save
  end

  test "should not create a new featured image when the image is missing" do
    featured_image = FeaturedImage.new(name: "The new featured image",
                                    alt_text: "A featured image")
    assert_not featured_image.save
  end

  test "should not create a new featured image when 2 featured images have the same name" do
    @featured_image.name = featured_images(:one).name
    assert_not @featured_image.save
  end

  test "should delete featured image when featured image is destroyed" do
    @featured_image.save
    assert_difference("FeaturedImage.count", -1) do
      @featured_image.destroy
    end
  end
end
