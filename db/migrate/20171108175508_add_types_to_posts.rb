class AddTypesToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_type, :string
    add_column :posts, :icon, :string
  end
end
