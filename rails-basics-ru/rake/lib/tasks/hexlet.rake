require 'csv'

namespace :hexlet do
  desc "task to load a list of users from a CSV file"
  task :import_users, [:csv_name] => :environment do |t, args|
    csv_name = args[:csv_name]
    headers_row, *arr_of_users = CSV.read(csv_name)
    # debugger
    arr_of_users.each do |user_data|
      pp user_data
      first_name, last_name, birthday, email = user_data
      user = User.create(first_name:, last_name:, birthday:, email:)
      pp user
    end
  end
end
