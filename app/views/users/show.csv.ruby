require 'csv'
CSV.generate do |csv|
  csv << column_names
  all.each do |model|
    csv << model.attributes.value_at(*column_names)
  end
end
    