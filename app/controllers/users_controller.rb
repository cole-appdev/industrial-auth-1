class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]

  def feed
    if params[:username] && params[:username] != current_user.username
      redirect_back fallback_location: root_url, alert: "You're not authorized for that."
    end
  end

  def discover
    if params[:username] && params[:username] != current_user.username
      redirect_back fallback_location: root_url, alert: "You're not authorized for that."
    end
  end

  private

    def set_user

      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
       #if User.find_by(username: params.fetch(:username))
       #   @user = User.find_by(username: params.fetch(:username))
       #else
       # redirect_back fallback_location: root_url, alert: "You're not authorized for that."
       #end
      
      else
        @user = current_user
      end
    end
end