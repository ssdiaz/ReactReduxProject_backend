class Trip < ApplicationRecord
    has_many :attendees, :dependent => :destroy
    has_many :activities, :dependent => :destroy
end
