class CreateAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :phone
      t.string :status
      t.string :notes
      t.string :relationship
      t.float  :lodgingBudget
      t.float  :eventsBudget

      # t.timestamps
    end
  end
end
