class AddUniqueIndexToCsp < ActiveRecord::Migration[5.2]
  def change
    add_index :course_subject_professors, [:course_subject_id, :professor_id], unique: true, name: 'unique_professor'
  end
end
