class RemoveCapacityFromHarvestExperiences < ActiveRecord::Migration[7.2]
  def change
    remove_column :harvest_experiences, :capacity, :integer
  end
end
