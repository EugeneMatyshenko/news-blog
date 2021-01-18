class AddTestField < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :test_column, :string
  end
end
