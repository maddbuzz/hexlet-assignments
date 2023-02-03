require 'csv'

namespace :hexlet do
  desc "task to load a list of users from a CSV file"
  task :import_users, [:csv_name] => :environment do |t, args|
    csv_name = args[:csv_name]
    headers_row, *arr_of_users = CSV.read(csv_name)
    old_user_count = User.count
    arr_of_users.each do |user_data|
      first_name, last_name, birthday, email = user_data
      user = User.create(first_name:, last_name:, birthday: Date.strptime(birthday, '%m/%d/%Y'), email:)
    end
    new_user_count = User.count
    print "Added #{new_user_count - old_user_count} users from '#{csv_name}'\n"
  end
end
