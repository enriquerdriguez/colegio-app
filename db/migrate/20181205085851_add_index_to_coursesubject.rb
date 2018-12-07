class AddIndexToCoursesubject < ActiveRecord::Migration[5.2]
  def change
    add_index :course_subjects, [:course_id, :subject_id, :professor_id], unique: true, name: 'unique_professor'
  end
end
