class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    @reservations_by_date = @reservations.group_by(&:date_reserved)
    # p "ASDFADSFZ"
    # p @reservations_by_date
    @reservations = @reservations.sort_by do |i|
      i[:group_id]  
    end
    new_hash = {}
    @reservations_by_date.each do |date, reservations|
      new_hash[date.to_date] = reservations
    end
    @reservations_by_date = new_hash
    @date = params[:date] ? Date.parse(params[:date]) : Date.today 

    response = Weather.lookup(12784296, Weather::Units::FARENHEIT)
    @temp = response.condition.temp
    @conditions = response.condition.text
    @image = response.image.url
    @datenow = response.condition.date.strftime('%A, %b %d')
    @sunset = response.astronomy.sunset.strftime('%I:%M: %p')
    @forecasts = response.forecasts
    @wind = response.wind
    
  end

  def edit
    @reservation = Reservation.find(params[:id])  

    @reservations = Reservation.all
    @reservations_by_date = @reservations.group_by(&:date_reserved)
    # p "ASDFADSFZ"
    # p @reservations_by_date
    @reservations = @reservations.sort_by do |i|
      i[:group_id]  
    end
    new_hash = {}
    @reservations_by_date.each do |date, reservations|
      new_hash[date.to_date] = reservations
    end
    @reservations_by_date = new_hash
    @date = params[:date] ? Date.parse(params[:date]) : Date.today 

    response = Weather.lookup(12784296, Weather::Units::FARENHEIT)
    @temp = response.condition.temp
    @conditions = response.condition.text
    @image = response.image.url
    @datenow = response.condition.date.strftime('%A, %b %d')
    @sunset = response.astronomy.sunset.strftime('%I:%M: %p')
    @forecasts = response.forecasts
    @wind = response.wind
  end

  def show
    @reservation = Reservation.find(params[:id])

    # @day = Date.parse(@reservation.date_reserved.to_s)

    response = Weather.lookup(12784296, Weather::Units::FARENHEIT)
    @temp = response.condition.temp
    @conditions = response.condition.text
    @image = response.image.url
    @datenow = response.condition.date.strftime('%A, %b %d')
    @sunset = response.astronomy.sunset.strftime('%I:%M: %p')
    @forecasts = response.forecasts
    @wind = response.wind
  end

  def new

    # @day = Date.parse(Date.today.to_s)
    # @day.wday

    @boat = current_user.group.boat
    @credits = current_user.group.credits

    @reservations = Reservation.all
    @reservations_by_date = @reservations.group_by(&:date_reserved)
    # p "ASDFADSFZ"
    # p @reservations_by_date
    @reservations = @reservations.sort_by do |i|
      i[:group_id]  
    end
    new_hash = {}
    @reservations_by_date.each do |date, reservations|
      new_hash[date.to_date] = reservations
    end
    @reservations_by_date = new_hash
    @date = params[:date] ? Date.parse(params[:date]) : Date.today 

    response = Weather.lookup(12784296, Weather::Units::FARENHEIT)
    @temp = response.condition.temp
    @conditions = response.condition.text
    @image = response.image.url
    @datenow = response.condition.date.strftime('%A, %b %d')
    @sunset = response.astronomy.sunset.strftime('%I:%M: %p')
    @forecasts = response.forecasts
    @wind = response.wind
    
  end

  def create

     @boat = current_user.group.boat
     @date = Date.today
    @current_credits = current_user.group.credits

    @reservation = Reservation.create({:date_reserved => params[:date_reserved], :user_id => params[:user_id], :group_id => params[:group_id], :am_block => params[:am_block], :pm_block => params[:pm_block], :full_day_block => params[:full_day_block]})

    @day = Date.parse(@reservation.date_reserved.to_s)
    @day = @day.wday
    puts @day.class
  
    if @reservation.save && @reservation.am_block? 
      @new_credit_total = (@current_credits - @boat.half_credit_AM_MTWTh)
    elsif @reservation.save && @reservation.pm_block?
      @new_credit_total = (@current_credits - @boat.half_credit_PM_MTWTh)
    elsif @reservation.save && @reservation.full_day_block?
      @new_credit_total = (@current_credits - @boat.full_credit_MTWTh)
    else 
      
    
    end
    puts @new_credit_total 

    @group = current_user.group
    @group.update({:credits => @new_credit_total})


    flash[:success] = "Reservation added"
    redirect_to '/reservations'
    

    
    
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update({:date_reserved => params[:date_reserved]})
    flash[:success] = "Your Reservation is scheduled for #{@reservation.date_reserved.strftime('%A, %b %d')}"
    redirect_to '/'


    response = Weather.lookup(12784296, Weather::Units::FARENHEIT)
    @temp = response.condition.temp
    @conditions = response.condition.text
    @image = response.image.url
    @datenow = response.condition.date.strftime('%A, %b %d')
    @sunset = response.astronomy.sunset.strftime('%I:%M: %p')
    @forecasts = response.forecasts
    @wind = response.wind 
  end

  def destroy
     @reservation = Reservation.find(params[:id])
     @reservation.destroy
     flash[:warning] = "Reservation Deleted"
     redirect_to "/index"
    
  end
end
