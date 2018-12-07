class DropTableCoursesubjectprofessor < ActiveRecord::Migration[5.2]
  def change
    drop_table :course_subject_professors
  end
end
