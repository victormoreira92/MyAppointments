class CreateAppointments < ActiveRecord::Migration[7.2]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
