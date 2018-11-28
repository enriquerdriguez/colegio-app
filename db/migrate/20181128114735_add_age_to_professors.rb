class AddAgeToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :age, :integer
  end
end
