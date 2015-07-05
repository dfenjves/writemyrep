require 'bundler'
Bundler.require
Dotenv.load
require 'pry'

require_relative 'models/legislator_finder.rb'

class ApplicationController < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    @repinfo = LegislatorFinder.new.find_by_zip(params[:zip])
    puts @repinfo
    erb :representatives
  end

  post '/representatives' do
    params.to_s
  end

end
