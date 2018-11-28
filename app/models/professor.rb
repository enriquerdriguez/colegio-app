class Professor < ApplicationRecord

  mount_uploader :picture, PictureProfessorUploader

end