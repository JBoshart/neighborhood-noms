class Nom < ActiveRecord::Base
  belongs_to :map

  YELP = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                              consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                              token: ENV["YELP_TOKEN"],
                              token_secret: ENV["YELP_TOKEN_SECRET"]})

  attr_reader :business_id, :name, :url, :image_url, :rating_img_url, :phone, :rating

  def initialize(restaurant_info)
    #Might be nice to add:
      #restaurant_info.businesses.categories (Array of Arrays)
      #
    @name = restaurant_info.name
    @phone = restaurant_info.phone
    @address = restaurant_info.location.address.first
    @city = restaurant_info.location.city
    @zip = restaurant_info.location.postal_code
    @neighborhood = restaurant_info.location.neighborhoods
    @url = restaurant_info.url
    @image_url = restaurant_info.image_url if !restaurant_info.image_url.nil?
    @rating_value = restaurant_info.rating
    @rating_img_url = restaurant_info.rating_img_url
  end

  def self.search(city, other_location)
    restaurants = YELP.search("#{city},#{other_location}", { term: 'restaurants' })

    noms = []
    restaurants.businesses.each do |restaurant|
      noms << self.new(restaurant) unless restaurant.is_closed == true
    raise
    end
  end
end
