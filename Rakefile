require 'sinatra/activerecord/rake'
require 'dotenv/load'

require 'active_record'

ActiveRecord::Base.configurations = {
  'development' => {
    'adapter' => 'mysql2',
    'host' => ENV['DB_HOST'],
    'port' => ENV['DB_PORT'],
    'username' => ENV['DB_USER'],
    'password' => ENV['DB_PASSWORD'],
    'database' => ENV['DB_DATABASE']
  },
  'production' => {
    'adapter' => 'mysql2',
    'host' => ENV['DB_HOST'],
    'port' => ENV['DB_PORT'],
    'username' => ENV['DB_USER'],
    'password' => ENV['DB_PASSWORD'],
    'database' => ENV['DB_DATABASE']
  }
}

env = ENV['RACK_ENV'] || 'development'
ActiveRecord::Base.establish_connection(env.to_sym)
