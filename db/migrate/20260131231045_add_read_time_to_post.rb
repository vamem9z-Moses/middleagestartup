class AddReadTimeToPost < ActiveRecord::Migration[8.1]
  def change
      add_column :posts, :read_time, :integer
  end
end
