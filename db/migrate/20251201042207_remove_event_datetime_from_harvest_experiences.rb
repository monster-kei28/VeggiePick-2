class RemoveEventDatetimeFromHarvestExperiences < ActiveRecord::Migration[7.2]
  def change
    remove_column :harvest_experiences, :event_datetime, :datetime
  end
end
