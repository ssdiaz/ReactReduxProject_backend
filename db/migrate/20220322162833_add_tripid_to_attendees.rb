class AddTripidToAttendees < ActiveRecord::Migration[6.1]
  def change
    add_column :attendees, :trip_id, :integer
  end
end
