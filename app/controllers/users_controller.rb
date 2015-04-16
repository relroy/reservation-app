class UsersController < ApplicationController

  

  def index
    if user_signed_in? && current_user.admin?
    @users = User.search(params[:search])
    @users = @users.sort_by do |i|
      i[:group_id] 
    end
    else render :file => "/public/404.html", :status => 404
    end
    
  end

  def new
   @user = User.new
    
  end

  def create
   @user = User.new(params[:user])
     
    
  end

  def show
    @user = User.find(params[:id])
    
  end

  def edit
      @groups = Group.all
    if user_signed_in? && current_user.admin?
      @user = User.find(params[:id])
      else render :file => "/public/404.html", :status => 404
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update({:first_name => params[:first_name], :last_name => params[:last_name], :address => params[:address], :city => params[:city], :state => params[:state], :zip_code => params[:zip_code], :phone => params[:phone], :notes => params[:notes],  :allowed => params[:allowed], :email=> params[:email],  :group_id=> params[:group_id], :group_members=> params[:group_members], :sailing_experience => params[:sailing_experience]})
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
