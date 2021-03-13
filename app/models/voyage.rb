class Voyage < ApplicationRecord
  belongs_to :user
  has_many :reservation, dependent: :destroy
  has_one_attached :photo
end
