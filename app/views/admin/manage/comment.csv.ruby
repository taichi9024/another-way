require 'csv'

CSV.generate do |csv|
  column_names = %w(id user.name space.name content)
  csv << column_names
  @spaces.each do |space|
    column_values = [
      space.id,
      space.user.name,
      space.space.name,
      space.content
    ]
    csv << column_values
  end
end