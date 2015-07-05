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
    @chosen_reps = []
    params.each_key do |bioguide_id|
    @chosen_reps << LegislatorFinder.new.find_by_bioguide_id(bioguide_id)
    end
    erb :template
  end

  post 'build' do
    
  end

end
