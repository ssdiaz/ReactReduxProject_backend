class AddTripidToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :trip_id, :integer
  end
end
