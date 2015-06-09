class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :blog
      t.string :post
      t.string :comment
      t.integer :view_count

      t.timestamps null: false
    end
  end
end
