require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'birthday_article'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)