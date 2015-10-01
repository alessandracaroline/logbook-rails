class Log < ActiveRecord::Base
  belongs_to :trip
  validates :latitude_hemisphere, :latitude_degrees, :latitude_minutes, :latitude_seconds, :longitude_hemisphere, :longitude_degrees, :longitude_minutes, :longitude_seconds, presence: true
  validates :latitude_minutes, :latitude_seconds, :longitude_minutes, :longitude_seconds, numericality: {:greater_than_or_equal_to => 0, :less_than => 60 }
  validates_numericality_of :latitude_degrees, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 90
  validates_numericality_of :longitude_degrees, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 180
  validates :latitude_degrees, :longitude_degrees, :latitude_minutes, :longitude_minutes, numericality: { only_integer: true }

  def coordinates_display
    "#{self.latitude_hemisphere} #{self.latitude_degrees}° #{self.latitude_minutes}' #{self.latitude_seconds}''   #{self.longitude_hemisphere} #{self.longitude_degrees}° #{self.longitude_minutes}' #{self.longitude_seconds}''"
  end

  def latitude
    if self.latitude_hemisphere == "N"
      decimal_degree(self.latitude_degrees, self.latitude_minutes, self.latitude_seconds)
    else
      - decimal_degree(self.latitude_degrees, self.latitude_minutes, self.latitude_seconds)
    end
  end

  def longitude
    if self.longitude_hemisphere == "E"
      decimal_degree(self.longitude_degrees, self.longitude_minutes, self.longitude_seconds)
    else
      - decimal_degree(self.longitude_degrees, self.longitude_minutes, self.longitude_seconds)
    end
  end

  def decimal_degree(degrees, minutes, seconds)
    (degrees.to_f + decimal(minutes, seconds)).to_f
  end

  def decimal(minutes, seconds)
    ((minutes.to_f/60) + (seconds.to_f/(60*60))).to_f
  end

end
