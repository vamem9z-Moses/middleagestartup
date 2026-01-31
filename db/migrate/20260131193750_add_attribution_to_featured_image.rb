class AddAttributionToFeaturedImage < ActiveRecord::Migration[8.1]
  def change
    add_column :featured_images, :attribution, :string, null: true
  end
end
