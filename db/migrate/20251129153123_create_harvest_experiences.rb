class CreateHarvestExperiences < ActiveRecord::Migration[7.2]
  def change
    create_table :harvest_experiences do |t|
      t.string :title
      t.datetime :event_datetime
      t.integer :capacity

      t.timestamps
    end
  end
end
