class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@status = current_user.statuses.build 
  		@feed_items = current_user.feed.paginate(page: params[:page], per_page: 15)
  	end
  end

  def help
  end

  def about
  end
end
