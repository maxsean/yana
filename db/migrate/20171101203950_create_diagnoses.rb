class CreateDiagnoses < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnoses do |t|
      t.belongs_to :user
      t.belongs_to :illness

      t.timestamps
    end
  end
end
