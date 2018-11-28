class DropAgeFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :age
  end
end
