class ProfileController < ApplicationController
  before_action :check_user

  def index
  end

  private
  def check_user
    if !current_user
      redirect_to new_user_session_path
    end
  end

end
