class Voyage < ApplicationRecord
  belongs_to :user
  belongs_to :reservation, dependent: :destroy
  has_one_attached :photo
end
