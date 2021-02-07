require 'csv'

CSV.generate do |csv|
  column_names = %w(id email content)
  csv << column_names
  @spaces.each do |space|
    column_values = [
      space.id,
      space.email,
      space.content
    ]
    csv << column_values
  end
end