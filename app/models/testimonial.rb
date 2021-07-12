class Testimonial < ApplicationRecord
  belongs_to :user

  validates :author, :position, :content, :avatar, :source, presence: true 
end
