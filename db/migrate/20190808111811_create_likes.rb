class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :user_uid
      t.string :post_uid
      t.string :likes
      t.string :extra
      t.timestamps
    end
  end
end
