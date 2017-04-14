namespace :user do
  require 'csv'

  desc 'import users from giving CSV file'
  task :import, [:path] => :environment do |_t, args|
    CSV.foreach(args[:path], :headers => true) do |row|
      User.create!(row.to_h)
    end
  end

  desc 'export all Users from database to CSV file'
  task :export => :environment do
    CSV.open('users.csv', 'w') do |file|
      file << User.attribute_names
      User.all.each { |u| file << u.attributes.values }
    end
  end
end
