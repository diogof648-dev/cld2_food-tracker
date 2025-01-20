# frozen_string_literal: true

require 'bundler/setup'
require 'sinatra/activerecord'
require 'active_record'
require 'mongoid'

db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config['development'])

Mongoid.load!('config/mongoid.yml', :development)

# Load all models
Dir['./app/models/*.rb'].sort.each { |file| require file }
