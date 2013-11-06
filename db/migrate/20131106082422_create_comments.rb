 class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :post_id
      t.integer :vote_count, default: 0
      t.timestamps
    end
  end
end
