class Attendee < ApplicationRecord
    validates_presence_of :name, :phone, :relationship
    validates :phone, numericality: { only_integer: true } 

    validates_inclusion_of :status, in: ['', 'Confirmed', 'Maybe', 'Not Coming']
    validates_inclusion_of :relationship, in: ['Bride', 'Bridesmaid', 'Maid of Honor', 'Matron of Honor', 'Attendee']
    
    before_save :titleize_name
end
