class CreatePostVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_votes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.integer :value, null: false, default: 0

      t.timestamps
    end
    add_index :post_votes, [:user_id, :post_id], unique: true
  end
end
