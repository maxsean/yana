class CreateIllnesses < ActiveRecord::Migration[5.1]
  def change
    create_table :illnesses do |t|

      t.timestamps
    end
  end
end
