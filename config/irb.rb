# frozen_string_literal: true

require 'bundler/setup'
require 'sinatra/activerecord'
require 'active_record'
require 'mongoid'

ActiveRecord::Base.establish_connectionActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: ENV['DB_HOST'],
  username: ENV['DB_USER'],
  password: ENV['DB_PASSWORD'],
  database: ENV['DB_DATABSE']
)

# Load all models
Dir['./app/models/*.rb'].sort.each { |file| require file }
