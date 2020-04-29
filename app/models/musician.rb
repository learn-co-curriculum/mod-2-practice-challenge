class Musician < ApplicationRecord
  has_many :band_members
  has_many :bands, through: :band_members

  def self.order_by_band_number
    band_count = all.includes(:bands).each_with_object(Hash.new { |h, k| h[k] = [] }) do |m, hash|
      hash[m.bands.size] << m
    end

    sorted_desc = band_count.sort_by { |k, v| -k }
    sorted_desc.map { |arr| arr[1] }.flatten
  end
end
