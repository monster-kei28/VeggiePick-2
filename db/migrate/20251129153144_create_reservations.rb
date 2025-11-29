class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :harvest_experience, null: false, foreign_key: true
      t.integer :number_of_people
      t.string :status
      t.datetime :reserved_at

      t.timestamps
    end
  end
end
