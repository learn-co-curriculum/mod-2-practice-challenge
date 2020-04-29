class BandMember < ApplicationRecord
  validates :instrument, length: { minimum: 3 }

  belongs_to :band
  belongs_to :musician
end
