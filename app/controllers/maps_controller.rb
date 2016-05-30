class MapsController < ApplicationController
  before_action :require_login

  def new
    render :new
  end

  def create
    @map = Map.create(complete_nom_count: 0, incomplete_nom_count: params[:limit], total_nom_count: params[:limit], user_id: current_user.id)

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
        nom.location.neighborhoods.each do |neighborhood|
          if neighborhood.downcase.include?("#{current_user.neighborhood.downcase}")
            @noms << nom
          end
        end
      end
    end

    @new_noms = []
    @new_noms << @noms.sample(params[:limit])
    render :show
  end

  private

  def maps_create_params
    params.permit(map: [:complete_nom_count, :incomplete_nom_count, :total_nom_count, :user_id])
  end
end
