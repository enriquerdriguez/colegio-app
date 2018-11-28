class AddBirthdateToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :birthdate, :datetime
  end
end
