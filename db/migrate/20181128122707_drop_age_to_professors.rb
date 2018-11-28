class DropAgeToProfessors < ActiveRecord::Migration[5.2]
  def change
    remove_column :professors, :age
  end
end
