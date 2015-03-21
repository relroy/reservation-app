class UsersController < ApplicationController

  def index
    # @users = User.all
    @users = User.search(params[:query])
    @users = @users.sort_by do |i|
      i[:group_id] 
    end
    
  end

  def show
    @user = User.find(params[:id])
    
  end

  def edit
    if user_signed_in? && current_user.admin?
      @user = User.find(params[:id])
      else render :file => "/public/404.html", :status => 404
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update({:first_name => params[:first_name], :last_name => params[:last_name], :address => params[:address], :city => params[:city], :state => params[:state], :zip_code => params[:zip_code], :phone => params[:phone], :boat_assigned => params[:boat_assigned], :full_share => params[:full_share], :two_thirds_share => params[:two_thirds_share], :allowed => params[:allowed], :email=> params[:email],  :group_id=> params[:group_id],  :group_size=> params[:group_size] })
    flash[:info] = "Update Complete"
    redirect_to "/users"
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:warning] = "User Deleted"
    redirect_to "/users"
    
  end
  # 

  def search
        
    @users = User.search(params[:query])
  end
  # 

end
