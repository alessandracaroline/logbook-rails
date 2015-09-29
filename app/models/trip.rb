class Trip < ActiveRecord::Base
  has_many :logs

  validates :title, presence: true
end
