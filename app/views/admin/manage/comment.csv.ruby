require 'csv'
bom = "\uFEFF"

CSV.generate(bom) do |csv|
  column_names = %w[id user.name space.name content]
  csv << column_names
  @comments.each do |comment|
    column_values = [
      comment.id,
      comment.user.name,
      comment.space.name,
      comment.content
    ]
    csv << column_values
  end
end
