require 'bundler'
Bundler.require
Dotenv.load

require_relative 'models/legislator_finder.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

end
