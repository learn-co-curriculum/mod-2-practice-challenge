class Band < ApplicationRecord
  has_many :band_members
  has_many :musicians, through: :band_members

  def average_age
    musicians.average(:age).to_int
  end
end
