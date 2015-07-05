require 'bundler'
Bundler.require
Dotenv.load

require_relative 'models/legislator_finder.rb'

class ApplicationController < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    @repinfo = LegislatorFinder.new.find_by_zip(params[:zip])
    erb :representatives
  end

end
