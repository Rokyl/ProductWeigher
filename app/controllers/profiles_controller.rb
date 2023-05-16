class ProfilesController < ApplicationController
  before_action :get_profile if current_user
  def show
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      redirect_to edit_profile_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit!(:user_id, :weigh, :height, :age, :sex, :activity)
  end

  def get_profile
    @profile = Profile.where(user_id: current_user.id)
  end
end
