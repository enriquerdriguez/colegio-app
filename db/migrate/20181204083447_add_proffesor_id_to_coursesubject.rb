class AddProffesorIdToCoursesubject < ActiveRecord::Migration[5.2]
  def change
    add_reference :course_subjects, :professor, foreign_key: true
  end
end
