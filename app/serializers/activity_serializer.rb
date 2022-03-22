class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost, :mandatory, :priority, :includeInTotal, :comment, :day, :time, :trip_id

  belongs_to :trip
end
