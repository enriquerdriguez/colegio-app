class CourseSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :course
  belongs_to :professor

  #has_one :course_subject_professors
  #has_one :professor

  delegate :name, :level, :id,:students, to: :course, prefix: true
  delegate :name, :id, to: :subject, prefix: true
  delegate :first_name, :last_name, :picture, to: :professor, prefix: true
end