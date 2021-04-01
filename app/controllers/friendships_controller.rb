class FriendshipsController < ApplicationController

  def create
    # stock = Stock.check_db(params[:ticker])
    # if stock.blank?
    #   stock = Stock.new_lookup(params[:ticker])
    #   stock.save
    # end
    # @user_stock = UserStock.create(user: current_user, stock: stock)
    # flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
    # redirect_to my_portfolio_path

  end

  def destroy
    friend = User.find(params[:id])
    friendship = Friendship.find_by(user_id: current_user.id, friend_id: friend.id )
    friendship.delete
    flash[:notice] = "#{friend.first_name} was successfully removed from friends list"
    redirect_to my_friends_path
  end

end
