require 'csv'
bom = "\uFEFF"
CSV.generate(bom) do |csv|
  column_names = %w(id email content)
  csv << column_names
  @feedbacks.each do |feedback|
    column_values = [
      feedback.id,
      feedback.email,
      feedback.content
    ]
    csv << column_values
  end
end