class CreateAuthors < ActiveRecord::Migration[8.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :blurb
      t.string :email

      t.timestamps
    end
  end
end
