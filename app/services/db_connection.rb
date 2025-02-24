# frozen_string_literal: true

require 'active_record'

# Class for the database connection
class DBConnection
  include Singleton

  def initialize
    @environment = ENV['RACK_ENV'] || 'development'
    connect_mariadb
  end

  def connect_mariadb
    ActiveRecord::Base.establish_connection(
      adapter: 'mysql2',
      host: ENV['DB_HOST'],
      port: ENV['DB_PORT'],
      username: ENV['DB_USER'],
      password: ENV['DB_PASSWORD'],
      database: ENV['DB_DATABASE']
    )
    $logger.info('MariaDB successfully connected')
  rescue ActiveRecord::ActiveRecordError => e
    $logger.error("MariaDB connection error: #{e.message}")
  end
end
