class ProfilesController < ApplicationController
  before_action :get_profile if current_user
  def show
    @profile
  end

  def edit
  end

  def update
  end

  private

  def profile_params

  end

  def get_profile
    Profile.where(user_id: current_user)
  end
end
