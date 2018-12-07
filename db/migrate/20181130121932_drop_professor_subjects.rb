class DropProfessorSubjects < ActiveRecord::Migration[5.2]
  def change
    drop_table :professor_subjects
  end
end
