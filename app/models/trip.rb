class Trip < ApplicationRecord
    has_many :attendees, :dependent => :destroy
    has_many :activities, :dependent => :destroy

    # before_save :titleize_location

    def assign_bride(attendee)
        if attendee.relationship == 'Bride'
            self.bride_id = attendee.id
            self.save
        end
    end

end
