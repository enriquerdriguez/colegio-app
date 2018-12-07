class Subject < ApplicationRecord

  has_many :course_subjects
  has_many :courses, through: :course_subjects

  has_many :student_subjects
  has_many :students, through: :student_subjects

  validates :name, presence: true, length: { minimum: 3, maximum: 50}

end
