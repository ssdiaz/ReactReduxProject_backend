class AddBrideidToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :bride_id, :integer
  end
end
