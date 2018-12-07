class CreateCourseSubjectProfessor < ActiveRecord::Migration[5.2]
  def change
    create_table :course_subject_professors do |t|
      t.references :course_subject, foreign_key: true
      t.references :professor, foreign_key: true
      t.timestamps
    end
  end
end
