require 'bundler'
require 'rack-flash'
require 'dotenv/load'

Bundler.require
ActiveRecord::Base.establish_connection({
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
})

require_all 'app'

ActiveRecord::Base.logger = Logger.new(STDOUT)