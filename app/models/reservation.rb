class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :harvest_experience
end
