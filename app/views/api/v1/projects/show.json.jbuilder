json.extract! @project, :id, :title, :tagline, :href, :description, :role
json.images @project.images do |image|
  json.extract! image, :id, :href
end