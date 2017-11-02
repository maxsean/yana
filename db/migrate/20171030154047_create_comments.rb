class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.text :body, null: false

      t.timestamps
    end
  end
end
