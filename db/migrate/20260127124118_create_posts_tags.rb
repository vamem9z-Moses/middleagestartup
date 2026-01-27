class CreatePostsTags < ActiveRecord::Migration[8.1]
  def change
    create_table :posts_tags do |t|
      t.belongs_to :post, index: false, foreign_key: true
      t.belongs_to :tag, index: false, foreign_key: true
      t.index %i[ post_id tag_id ], name: "index_posts_tags_uniqueness", unique: true
      t.index %i[ tag_id post_id ], name: "index_tags_posts_uniqueness", unique: true
      t.timestamps
    end
  end
end
