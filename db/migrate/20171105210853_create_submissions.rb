class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.integer :answer, null: false

      t.timestamps
    end
    add_index :submissions, [:user_id, :question_id], unique: true
  end
end
