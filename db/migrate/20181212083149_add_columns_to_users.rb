class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :telephone, :string
    add_column :users, :picture, :string
    add_column :users, :type, :string
    add_column :users, :birthdate, :datetime
  end
end
