class CreateIllnesses < ActiveRecord::Migration[5.1]
  def change
    create_table :illnesses do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
