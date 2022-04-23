def say(mess) = puts(mess)

namespace :db do
  desc 'Drop, create and migrate the database.'
  task reinstall: :environment do
    ['uploads', 'public/uploads'].each do |path|
      cmd = "rm -fr #{path}"
      puts cmd
      `#{cmd}`
    end
    Rake::Task['db:drop'].invoke
    Rake::Task['db:install'].invoke
    Rake::Task['db:seed'].invoke if Rails.env.development? || Rails.env.test?
  end

  desc 'Creates and populates the initial database for a new project.'
  task install: ['tmp:create', 'tmp:cache:clear', 'db:create', 'db:migrate']
end
