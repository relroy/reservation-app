class GroupsController < ApplicationController

  def index
  @groups = Group.all
  @users = User.all
  

end 

def new
  @boats = Boat.all
  @boat = Boat.find(1)
  
end

def create
  @group = Group.create({:credits => params[:credits], :boat_id => params[:boat_id], :two_thirds_share => params[:two_thirds_share], :full_share => params[:full_share], :captain => params[:captain]})

  @current_shares_possible = @group.boat.shares_possible


  if @group.save && @group.two_thirds_share?
    @new_shares_possible = (@current_shares_possible - 1)
    # puts @new_shares_possible
    @group.boat.update({:shares_possible => @new_shares_possible})
    @group.update({:credits => @group.boat.two_thirds_credits_total})
  elsif @group.save && @group.full_share?
    @new_shares_possible = (@current_shares_possible - 1)
    # puts @new_shares_possible
    @group.boat.update({:shares_possible => @new_shares_possible})
    @group.update({:credits => @group.boat.full_credits_total})
  end

  
  flash[:success] = "Group added"
    redirect_to '/groups'
end

#connect these actions through join table with Users model?
# def show

# end




def edit
    @group = Group.find(params[:id])
    @boats = Boat.all
  end


  def update
    @group = Group.find(params[:id])
    @group.update({:credits => params[:credits], :boat_id => params[:boat_id], :captain => params[:captain]})#how will this connect with user_id in Users model?
    @boat = @group.boat
    # @boat.update({:shares_possible => params[:shares_possible]})
    flash[:info] = "Update Complete"
    redirect_to "/boats" 
  end


  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:warning] = "Group Deleted"
    redirect_to "/groups"
  end
end
