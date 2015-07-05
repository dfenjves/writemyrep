class LegislatorFinder

  def find_by_zip(zipcode)
    url = "https://congress.api.sunlightfoundation.com/legislators/locate?zip=#{zipcode}&apikey=#{ENV['SUNLIGHT_API_KEY']}"
    HTTParty.get(url)['results']
  end

  def find_by_bioguide_id(bioguide_id)
    url = "https://congress.api.sunlightfoundation.com/legislators?bioguide_id=#{bioguide_id}&apikey=#{ENV['SUNLIGHT_API_KEY']}"
    HTTParty.get(url)['results']
  end

end