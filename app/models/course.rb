class Course < ApplicationRecord

  has_many :course_subjects
  has_many :subjects, through: :course_subjects
  has_many :students


  def subjects_to_add
    Subject.all - subjects
  end

  validates :name, presence: true, length: { minimum: 3, maximum: 50}
  validates :level, presence: true, length: { minimum: 3, maximum: 5}

end
