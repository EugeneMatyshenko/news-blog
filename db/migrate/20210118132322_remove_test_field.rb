class RemoveTestField < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :test_column, :string
  end
end
