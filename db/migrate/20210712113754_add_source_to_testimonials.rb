class AddSourceToTestimonials < ActiveRecord::Migration[6.0]
  def change
    add_column :testimonials, :source, :string
  end
end
