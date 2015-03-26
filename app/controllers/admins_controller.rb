class AdminsController < ApplicationController

  def index
    if user_signed_in? && current_user.admin?
    @users = User.all
    else render :file => "/public/422.html", :status => 422
    end

    @boats = Boat.all

    response = Weather.lookup(12784296, Weather::Units::FARENHEIT)
    @temp = response.condition.temp
    @conditions = response.condition.text
    @image = response.image.url
    @datenow = response.condition.date.strftime('%A, %b %d')
    @sunset = response.astronomy.sunset.strftime('%I:%M: %p')
    @forecasts = response.forecasts
    @wind = response.wind

    
    
  end

end
