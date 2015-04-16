class ChargesController < ApplicationController

def new
  @user = current_user

    if @user.group.full_share?
  @amount = (@user.group.boat.full_share_price).to_i
    elsif @user.group.two_thirds_share?
  @amount = (@user.group.boat.two_thirds_share_price).to_i
    end
end

def create
  # Amount in cents
  @user = current_user

    if @user.group.full_share?
  @amount = (@user.group.boat.full_share_price).to_i
    elsif @user.group.two_thirds_share?
  @amount = (@user.group.boat.two_thirds_share_price).to_i
    end

  customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end



end
