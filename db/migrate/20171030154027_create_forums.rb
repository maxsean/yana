class CreateForums < ActiveRecord::Migration[5.1]
  def change
    create_table :forums do |t|
      t.belongs_to :illness
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
