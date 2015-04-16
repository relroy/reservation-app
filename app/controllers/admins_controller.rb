class AdminsController < ApplicationController

  def index
    if user_signed_in? && current_user.admin?
    @users = User.all
    else render :file => "/public/422.html", :status => 422
    end

    @boats = Boat.all

    @groups = Group.all
    
  end

end
