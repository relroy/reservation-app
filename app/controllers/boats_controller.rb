class BoatsController < ApplicationController

	def index
		@boats = Boat.all
	end

	def show
 		@boat = Boat.find(params[:id])
 		# if @boat.shares_possible < 1
 		# 	flash[:notice] = "Sorry, all the shares for this vessel are taken at this time. Please check back soon."
 		# end
	end


	def new
	end

	def create
		boat = Boat.create({:image_url => params[:image_url], :name => params[:name], :make => params[:make],:size => params[:size], :harbor => params[:harbor], :shares_possible => params[:shares_possible], :full_share_price => params[:full_share_price], :two_thirds_share_price => params[:two_thirds_share_price], :half_credit_AM_MTWTh => params[:half_credit_AM_MTWTh], :half_credit_PM_MTWTh => params[:half_credit_PM_MTWTh], :half_credit_AM_F => 
			params[:half_credit_AM_F],:half_credit_PM_F => params[:half_credit_PM_F], :half_credit_AM_SAT => 
			params[:half_credit_AM_SAT],:half_credit_PM_SAT => params[:half_credit_PM_SAT], :half_credit_AM_SUN => 
			params[:half_credit_AM_SUN],:half_credit_PM_SUN => params[:half_credit_PM_SUN], :full_credit_MTWTh => 
			params[:full_credit_MTWTh],:full_credit_F => params[:full_credit_F], :full_credit_SAT => 
			params[:full_credit_SAT],:full_credit_SUN => params[:full_credit_SUN]}) 
		flash[:success] = "Boat added"
		redirect_to '/boats' 
	end


	def edit
		@boat = Boat.find(params[:id])
	end


	def update
		@boat = Boat.find(params[:id])
		@boat.update({:image_url => params[:image_url], :name => params[:name], :make => params[:make],:size => params[:size], :harbor => params[:harbor], :shares_possible => params[:shares_possible], :full_share_price => params[:full_share_price], :two_thirds_share_price => params[:two_thirds_share_price], :half_credit_AM_MTWTh => params[:half_credit_AM_MTWTh], :half_credit_PM_MTWTh => params[:half_credit_PM_MTWTh], :half_credit_AM_F => 
			params[:half_credit_AM_F],:half_credit_PM_F => params[:half_credit_PM_F], :half_credit_AM_SAT => 
			params[:half_credit_AM_SAT],:half_credit_PM_SAT => params[:half_credit_PM_SAT], :half_credit_AM_SUN => 
			params[:half_credit_AM_SUN],:half_credit_PM_SUN => params[:half_credit_PM_SUN], :full_credit_MTWTh => 
			params[:full_credit_MTWTh],:full_credit_F => params[:full_credit_F], :full_credit_SAT => 
			params[:full_credit_SAT],:full_credit_SUN => params[:full_credit_SUN]})
		flash[:info] = "Update Complete"
		redirect_to "/boats/#{@boat.id}" 

	end


	def destroy
		@boat = Boat.find(params[:id])
		@boat.destroy
		flash[:warning] = "Boat Deleted"
		redirect_to "/boats"
	end



end
