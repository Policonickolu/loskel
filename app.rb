require "sinatra"
require "sinatra/activerecord"

require_relative "database"

require "./models/article"
require "./models/comment"

enable :sessions

set :database, {adapter: "sqlite3", database: "postapp"}