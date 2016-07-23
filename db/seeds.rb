require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/crowns.csv"), headers: true) do |row|
  Crown.find_or_create_by(name: row[0], price: row[1], color: row[2], flower_type: row[3], description: row[4], picture_url: row[5])
end