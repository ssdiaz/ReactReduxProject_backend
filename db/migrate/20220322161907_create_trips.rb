class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :location
      t.date :start_date
      t.date :end_date
      # t.integer :bride_id #has one bride - who is an attendee

      # t.timestamps
    end
  end
end
