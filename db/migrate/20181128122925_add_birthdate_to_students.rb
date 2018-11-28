class AddBirthdateToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :birthdate, :datetime
  end
end
