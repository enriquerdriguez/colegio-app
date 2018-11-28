class AddImageToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :picture, :string
  end
end
