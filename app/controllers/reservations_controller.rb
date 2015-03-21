class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    @reservations = @reservations.sort_by do |i|
      i[:group_id]   
    end
    
  end

  def edit
    @reservation = Reservation.find(params[:id])
    
  end

  def show
    @reservation = Reservation.find(params[:id])
    @group = Group.find(params[:id])

  end

  def new
    
  end

  def create
    @reservation = Reservation.create({:date_reserved => [:date_reserved], :am_block => [:am_block], :pm_block => [:pm_block], :full_day_block => [:full_day_block], :user_id => [:user_id], :boat_id => [:boat_id], :group_id => [:group_id]})
    
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation = Reservation.update({:date_reserved => [:date_reserved], :am_block => [:am_block], :pm_block => [:pm_block], :full_day_block => [:full_day_block], :user_id => [:user_id], :boat_id => [:boat_id], :group_id => [:group_id]})    
  end

  def destroy
     @reservation = Reservation.find(params[:id])
     @reservation.destroy
     flash[:warning] = "Reservation Deleted"
     redirect_to "/index"
    
  end




end
