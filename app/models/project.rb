class Project < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy

  validates :title, :tagline, :splash, :description, :href, :role, presence: true 
end
