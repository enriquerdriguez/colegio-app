class CreateProfessor < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :telephone
      t.timestamps
    end
  end
end
