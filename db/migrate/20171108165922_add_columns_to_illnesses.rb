class AddColumnsToIllnesses < ActiveRecord::Migration[5.1]
  def change
    add_column :illnesses, :infourl, :string
    add_column :illnesses, :trialurl, :string
  end
end
