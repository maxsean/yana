class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.string :description

      t.timestamps
    end
  end
end
