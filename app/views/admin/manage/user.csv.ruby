require 'csv'
bom = "\uFEFF"

CSV.generate(bom) do |csv|
  column_names = %w(id email name created_at)
  csv << column_names
  @users.each do |user|
    column_values = [
      user.id,
      user.email,
      user.name,
      user.created_at
    ]
    csv << column_values
  end
end