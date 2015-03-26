class GroupsController < ApplicationController

  def index
  @groups = Group.all
  @users = User.all

 response = Weather.lookup(12784296, Weather::Units::FARENHEIT)
    @temp = response.condition.temp
    @conditions = response.condition.text
    @image = response.image.url
    @datenow = response.condition.date.strftime('%A, %b %d')
    @sunset = response.astronomy.sunset.strftime('%I:%M: %p')
    @forecasts = response.forecasts
    @wind = response.wind
  

end 

#connect these actions through join table with Users model?
# def show

# end

# def new

# end

# def create

# end


def edit
    @group = Group.find(params[:id])

  end


  def update
    @group = Group.find(params[:id])
    @group.update({:group_id => params[:group_id], :group_size => params[:group_size], :user_id => params[:user_id]})#how will this connect with user_id in Users model?
    flash[:info] = "Update Complete"
    redirect_to "/groups" 
  end


  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:warning] = "Group Deleted"
    redirect_to "/groups"
  end
end
