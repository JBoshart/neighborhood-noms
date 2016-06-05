class MapsController < ApplicationController
  before_action :require_login

  def new
    render :new
  end

  def create
    if params[:zip]
      @noms = Nom.search(current_user.city, current_user.zip)

    elsif params[:street]
      @search = Nom.search(current_user.city, current_user.street)
      @noms = []

      @search.each do |nom|
        if nom.address.downcase.include?("#{current_user.street.downcase}")
          @noms << nom
        end
      end

    elsif params[:neighborhood]
      @search = Nom.search(current_user.city, current_user.neighborhood)
      @noms = []
      @search.each do |nom|
        nom.neighborhood.each do |neighborhood|
          if neighborhood.downcase.include?("#{current_user.neighborhood.downcase}")
            @noms << nom
          end
        end
      end
    end

    @new_noms = []
    @new_noms << @noms.sample(params[:limit].to_i) unless @noms.first.nil?

    @map = Map.create(complete_nom_count: 0, incomplete_nom_count: params[:limit], total_nom_count: params[:limit], user_id: current_user.id)

    raise

    @new_noms[0].each do |nom|
      Nom.create(name: nom.name, phone: nom.phone, address: nom.address, city: nom.city, zip: nom.zip, url: nom.url, image_url: nom.image_url, rating_value: nom.rating_value, rating_img_url: nom.rating_img_url, neighborhood: nom.neighborhood, map_id: @map.id)
    end

    raise
    render :show
  end

  private

  def maps_create_params
    params.permit(map: [:complete_nom_count, :incomplete_nom_count, :total_nom_count, :user_id])
  end

  def nom_create_params
    params.permit(nom: [:name, :phone, :address, :city, :zip, :url, :image_url, :rating_value, :rating_img_url, :neighborhood, :map_id])
  end
end
