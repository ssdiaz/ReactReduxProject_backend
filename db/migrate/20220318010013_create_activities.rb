class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.float :cost
      t.boolean :mandatory
      t.string :priority
      t.boolean :includeInTotal
      t.string :comment
      t.string :day
      t.string :time

      # t.timestamps
    end
  end
end
