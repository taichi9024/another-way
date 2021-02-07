require 'csv'

CSV.generate do |csv|
  column_names = %w(id user.name owner price placename)
  csv << column_names
  @spaces.each do |space|
    column_values = [
      space.id,
      space.user.name,
      space.owner,
      space.price,
      space.placename
    ]
    csv << column_values
  end
end