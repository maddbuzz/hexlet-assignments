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

  desc 'Updates user name'
  task :update => :environment do
    name = ARGV[1]
    print "Change user name to #{name}"

    User.find(1).update(name: name)
  end
end
