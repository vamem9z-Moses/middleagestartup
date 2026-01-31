class AddAuthorsToPosts < ActiveRecord::Migration[8.1]
  def change
    add_reference :posts, :author, foreign_key: true
  end
end
