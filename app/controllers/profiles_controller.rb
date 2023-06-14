class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def new
    @profile = Profile.new
  end
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to @profile
    else
      redirect_to edit_profile_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:weigh, :height, :age, :sex, :activity, :region)
  end

  def get_profile
    @profile = Profile.where(user_id: current_user.id)
  end
end
