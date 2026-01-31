class CreateFeaturedImages < ActiveRecord::Migration[8.1]
  def change
    create_table :featured_images do |t|
      t.string :name
      t.string :alt_text

      t.timestamps
    end
  end
end
