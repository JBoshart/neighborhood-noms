class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update]

  def index
    if !current_user.nil?
      render :show
    else
      redirect_to login_path
    end
  end

  # Create new user shell for form
  def new
    @user = User.new
  end

  # Save user provided informtion to the database, direct to login if successfull
  def create
    @user = User.new(user_create_params[:user])
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  # Show user profile page, with maps and badges
  def show
    #currently commented out because these tables are empty
    #@maps = Map.find_by(user_id: current_user.id)
    #@badges = Badge.where(id: current_user.badge_ids)
    render :show
  end

  # Edit user profile page
  def edit
    @user = User.find(current_user.id)
    render :edit
  end

  # Save edited changes
  def update
    @user = User.find(current_user.id)
    @user.update(user_create_params[:user])
    redirect_to user_path(current_user.id)
  end

  private

  def user_create_params
    params.permit(user: [:email, :password, :password_confirmation, :name, :address, :street, :city, :state, :zip])
  end
end
