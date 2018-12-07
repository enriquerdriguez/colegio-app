class Student < ApplicationRecord

  belongs_to :course

  has_many :student_subjects
  has_many :subjects, through: :student_subjects

  mount_uploader :picture, PictureUploader

  delegate :subjects, :name, :level, to: :course, prefix: true


  #Validations
  validates :first_name, presence: true, length: { minimum: 3, maximum: 50}
  validates :last_name, presence: true, length: { minimum: 3, maximum: 70}
  VALID_EMAIL_VALIDATION = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            length: {maximum: 105},
            uniqueness: {case_sensitive: false},
            format: { with: VALID_EMAIL_VALIDATION}

  def subjects_to_add
    Subject.all - course_subjects
  end


end