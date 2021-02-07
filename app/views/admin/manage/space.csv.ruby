require 'csv'

CSV.generate do |csv|
  column_names = %w(id name user.name tel price)
  csv << column_names
  @spaces.each do |space|
    column_values = [
      space.id,
      space.name,
      space.user.name,
      space.tel,
      space.price
    ]
    csv << column_values
  end
end