class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.belongs_to :question
      t.string :body, null: false

      t.timestamps
    end
  end
end
