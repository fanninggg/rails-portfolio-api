class Image < ApplicationRecord
  belongs_to :project

  validates :href, presence: true 
end
