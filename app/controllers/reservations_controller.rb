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

    # response = Weather.lookup(12784296, Weather::Units::FARENHEIT)
    # @temp = response.condition.temp
    # @conditions = response.condition.text
    # @image = response.image.url
    # @datenow = response.condition.date.strftime('%A, %b %d')
    # @sunset = response.astronomy.sunset.strftime('%I:%M: %p')
    # @forecasts = response.forecasts
    # @wind = response.wind
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
    @current_credits_used = 0

    @reservation = Reservation.create({:date_reserved => params[:date_reserved], :user_id => params[:user_id], :group_id => params[:group_id], :am_block => params[:am_block], :pm_block => params[:pm_block], :full_day_block => params[:full_day_block]})

    @day = Date.parse(@reservation.date_reserved.to_s)
    @weekday = @day.wday
    # puts @weekday.class
    # puts @weekday
  
    if @reservation.save && @reservation.am_block? && @weekday == 1||@weekday == 2||@weekday == 3||@weekday == 4
      @new_credit_total = (@current_credits - @boat.half_credit_AM_MTWTh)
      @new_credits_used = (@current_credits_used + @boat.half_credit_AM_MTWTh)
    elsif @reservation.save && @reservation.pm_block? && @weekday == 1||@weekday == 2||@weekday == 3||@weekday == 4
      @new_credit_total = (@current_credits - @boat.half_credit_PM_MTWTh)
      @new_credits_used = (@current_credits_used + @boat.half_credit_PM_MTWTh)
    elsif @reservation.save && @reservation.full_day_block? && @weekday == 1||@weekday == 2||@weekday == 3||@weekday == 4
      @new_credit_total = (@current_credits - @boat.full_credit_MTWTh)
      @new_credits_used = (@current_credits_used + @boat.full_credit_MTWTh)

    elsif @reservation.save && @reservation.am_block? && @weekday == 5
      @new_credit_total = (@current_credits - @boat.half_credit_AM_F)
      @new_credits_used = (@current_credits_used + @boat.half_credit_AM_F)
    elsif @reservation.save && @reservation.pm_block? && @weekday == 5
      @new_credit_total = (@current_credits - @boat.half_credit_PM_F)
      @new_credits_used = (@current_credits_used + @boat.half_credit_PM_F)
    elsif @reservation.save && @reservation.full_day_block? && @weekday == 5
      @new_credit_total = (@current_credits - @boat.full_credit_F)
      @new_credits_used = (@current_credits_used + @boat.full_credit_F)
    elsif @reservation.save && @reservation.am_block? && @weekday == 6
      @new_credit_total = (@current_credits - @boat.half_credit_AM_SAT)
      @new_credits_used = (@current_credits_used + @boat.half_credit_AM_SAT)
    elsif @reservation.save && @reservation.pm_block? && @weekday == 6
      @new_credit_total = (@current_credits - @boat.half_credit_PM_SAT)
      @new_credits_used = (@current_credits_used + @boat.half_credit_PM_SAT)
    elsif @reservation.save && @reservation.full_day_block? && @weekday == 6
      @new_credit_total = (@current_credits - @boat.full_credit_SAT)
      @new_credits_used = (@current_credits_used + @boat.full_credit_SAT)
      elsif @reservation.save && @reservation.am_block? && @weekday == 0
      @new_credit_total = (@current_credits - @boat.half_credit_AM_SUN)
      @new_credits_used = (@current_credits_used + @boat.half_credit_AM_SUN)
    elsif @reservation.save && @reservation.pm_block? && @weekday == 0
      @new_credit_total = (@current_credits - @boat.half_credit_PM_SUN)
      @new_credits_used = (@current_credits_used + @boat.half_credit_PM_SUN)
    elsif @reservation.save && @reservation.full_day_block? && @weekday == 0
      @new_credit_total = (@current_credits - @boat.full_credit_SUN)
      @new_credits_used = (@current_credits_used + @boat.full_credit_SUN)
    else 
      
    
    end
    # puts @new_credit_total 
    puts @new_credits_used

    @group = current_user.group
    @group.update({:credits => @new_credit_total, :credits_used => @new_credits_used})


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
