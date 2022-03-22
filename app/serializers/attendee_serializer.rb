class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :status, :notes, :relationship, :lodgingBudget, :eventsBudget, :trip_id

  belongs_to :trip
end
