class BandMember < ApplicationRecord
  validates :instrument, length: { minimum: 3 }
  validates :musician_id, uniqueness: { scope: :band_id, message: 'can only be listed in the same band once' }

  belongs_to :band
  belongs_to :musician
end
