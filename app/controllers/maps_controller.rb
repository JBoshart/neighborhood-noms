class MapsController < ApplicationController
  before_action :require_login

  def new
    render :new
  end

  def create
    if params[:zip]
      @noms = Noms.search(current_user.city, current_user.zip)
    elsif params[:street]
      @noms = Nom.search(current_user.city, current_user.street)
    end


  end

  private

  def user_create_params
    params.permit(map: [:complete_nom_count, :incomplete_nom_count, :total_nom_count, :user_id])
  end
end
