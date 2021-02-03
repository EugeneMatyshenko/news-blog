class RemoveActiveFromUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :active, :boolean, default: true
    remove_column :users, :active, :boolean, default: true
  end

  def up
    super
  end

  def down
    #when migrate
    super
  end
end
