json.array! @projects do |project|
  json.extract! project, :id, :splash, :tagline
end