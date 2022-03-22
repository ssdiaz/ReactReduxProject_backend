ActiveRecord::Schema.define(version: 2022_03_18_011308) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "cost"
    t.boolean "mandatory"
    t.string "priority"
    t.boolean "includeInTotal"
    t.string "comment"
    t.string "day"
    t.string "time"
  end

  create_table "attendees", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "status"
    t.string "notes"
    t.string "relationship"
    t.float "lodgingBudget"
    t.float "eventsBudget"
  end

end
