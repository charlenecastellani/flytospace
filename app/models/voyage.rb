class Voyage < ApplicationRecord
  belongs_to :user
  belongs_to :reservation
  has_one_attached :photo
end
