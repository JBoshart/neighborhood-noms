class Nom < ActiveRecord::Base
  belongs_to :map
  
  YELP = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                              consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                              token: ENV["YELP_TOKEN"],
                              token_secret: ENV["YELP_TOKEN_SECRET"]})

  attr_reader :business_id, :name, :url, :image_url, :phone, :rating

  def initialize(suggestion_data)
    @business_id = suggestion_data.business.id
    @name = suggestion_data.business.name
    @url = suggestion_data.business.url
    @image_url = suggestion_data.business.image_url if !suggestion_data.business.image_url.nil?
    @rating = suggestion_data.business.rating_img_url
    @phone = suggestion_data.business.phone
    @rating = suggestion_data.business.rating
  end

  def self.search(location)
    restaurants = YELP.search("#{location}", { term: 'restaurants' })
  end
end
