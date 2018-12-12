class DropTableStudentsAndProfessors < ActiveRecord::Migration[5.2]
  def change
    drop_table :professors
    drop_table :students
  end
end
