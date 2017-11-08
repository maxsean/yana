class AddShortToChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :choices, :short, :string
  end
end
