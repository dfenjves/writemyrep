require 'pry'
class Legislator_Finder

  def initialize(zipcode)
    @zipcode = zipcode
    url = "https://congress.api.sunlightfoundation.com/legislators/locate?zip=#{@zipcode}&apikey=#{ENV['SUNLIGHT_API_KEY']}"
    puts url
    @legislators =  HTTParty.get(url)['results']
  end

  def legislators
    @legislators
  end

  def junior_senator
    legislators.select do |rep|
      rep['chamber'] == 'senate'  && rep['state_rank'] == 'junior'
    end.first
  end

  def senior_senator
    legislators.select do |rep|
      rep['chamber'] == 'senate' && rep['state_rank'] == 'senior'
    end.first
  end

  def congressmen
    legislators.select do |rep|
      rep['chamber'] == 'house'
    end
  end


end