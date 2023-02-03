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
