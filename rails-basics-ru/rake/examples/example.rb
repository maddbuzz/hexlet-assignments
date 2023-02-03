namespace :users do
  desc 'Creates 5 users'
  task :create => :environment do
    print "Task started...\n"

    5.times do |i|
      User.create(name: "Alice #{i + 1}")
      print '.'
    end

    print "\n...done\n"
  end

  # bin/rails users:update name=vasya
  desc 'Updates user name'
  task update: :environment do
    print "Task started...\n"

    User.find(1).update(name: ENV['name'])

    print "\n...done\n"
  end
end

namespace :users do
  # bin/rails 'users:update[vasya]'
  desc 'Updates user name'
  task :update, [:name] => :environment do |t, args|
    name = args[:name]
    print "Change user name to #{name}"

    User.find(1).update(name: name)

    print "\n...done\n"
  end
end

namespace :manipulate_files do
  desc "Creates file in tmp folder"
  task :create do
    touch "tmp/rake_test.file.rb"
  end

  desc "Show files list"
  task :show do
    # FileList - хелпер Rake
    # https://docs.ruby-lang.org/en/2.2.0/Rake/FileList.html
    FileList.new('config/environments/*.rb') do |file|
      pp file.exclude(/dev/)
    end
  end
end
