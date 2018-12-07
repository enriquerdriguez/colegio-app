class Professor < ApplicationRecord


  #has_many :course_subject_professors
  #has_many :subjects, through: :course_subject_professors
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :subjects, through: :course_subjects

  mount_uploader :picture, PictureProfessorUploader

  #Validations
  validates :first_name, presence: true, length: { minimum: 3, maximum: 50}
  validates :last_name, presence: true, length: { minimum: 3, maximum: 70}
  VALID_EMAIL_VALIDATION = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: { with: VALID_EMAIL_VALIDATION}

end