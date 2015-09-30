class Log < ActiveRecord::Base
  belongs_to :trip
  validates :latitude_hemisphere, :latitude_degrees, :latitude_minutes, :latitude_seconds, :longitude_hemisphere, :longitude_degrees, :longitude_minutes, :longitude_seconds, presence: true
  validates :latitude_minutes, :latitude_seconds, :longitude_minutes, :longitude_seconds, numericality: {:greater_than_or_equal_to => 0, :less_than => 60 }
  validates_numericality_of :latitude_degrees, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 90
  validates_numericality_of :longitude_degrees, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 180
  validates :latitude_degrees, :longitude_degrees, :latitude_minutes, :longitude_minutes, numericality: { only_integer: true }
end
