class Activity < ApplicationRecord
    belongs_to :trip
    
    validates_presence_of :name
    # validates_presence_of :name, :cost
    # validates :cost, numericality: true

    validates_inclusion_of :priority, in: ['', 'HIGH', 'MEDIUM', 'LOW']
    
    before_save :titleize_name
end
