class AddFeaturedImageToPosts < ActiveRecord::Migration[8.1]
  def change
    add_reference :posts, :featured_image, foreign_key: true
  end
end
