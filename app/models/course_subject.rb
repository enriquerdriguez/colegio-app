class CourseSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :course
  belongs_to :professor

  #has_one :course_subject_professors
  #has_one :professor, through: :course_subject_professors

  delegate :name, :level, :id,:students, to: :course, prefix: true
  delegate :name, :id, to: :subject, prefix: true
  delegate :first_name, :last_name, to: :professor, prefix: true
end