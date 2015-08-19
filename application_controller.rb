require 'bundler'
Bundler.require
Dotenv.load
require 'pry'

require_relative 'models/legislator_finder.rb'
require_relative 'models/letter_builder.rb'

class ApplicationController < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    @repinfo = LegislatorFinder.new.find_by_zip(params[:zip])
    erb :representatives
  end

  post '/representatives' do
    rep = LegislatorFinder.new.find_by_bioguide_id(params[:bioguide_id])
    @letter = LetterBuilder.new(rep)
    erb :write
  end

  post '/build' do
    rep = LegislatorFinder.new.find_by_bioguide_id(params[:bioguide_id])
    @letter = LetterBuilder.new(rep)
    @letter.content = params[:content]
    @letter.writer_name = params[:writer_name]
    @letter.writer_address = params[:writer_address]
    @letter.writer_phone = params[:writer_phone]
    @letter.writer_email = params[:writer_email]
    erb :review
  end

end
