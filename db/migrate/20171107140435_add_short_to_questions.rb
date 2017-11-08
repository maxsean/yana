class AddShortToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :short, :string
  end
end
