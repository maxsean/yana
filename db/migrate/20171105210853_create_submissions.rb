class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.belongs_to :choice
      t.belongs_to :user

      t.timestamps
    end
    add_index :submissions, [:user_id, :choice_id], unique: true
  end
end
