class TripSerializer < ActiveModel::Serializer
  attributes :id, :location, :start_date, :end_date, :bride_id

  has_many :attendees
  has_many :activities
end
