class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :logs

  validates :title, presence: true
end
