class CreateProfessionals < ActiveRecord::Migration[7.2]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :specialty

      t.timestamps
    end
  end
end
