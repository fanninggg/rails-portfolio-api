json.array! @testimonials do |testimonial|
  json.extract! testimonial, :id, :author, :position, :content, :avatar, :source
end