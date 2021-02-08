require 'csv'
bom = "\uFEFF"

CSV.generate(bom) do |csv|
  column_names = %w[id user.name owner price placename]
  csv << column_names
  @payments.each do |pay|
    column_values = [
      pay.id,
      pay.user.name,
      pay.owner,
      pay.price,
      pay.placename
    ]
    csv << column_values
  end
end
