class SiteController < ApplicationController

  def index
    if params[:set_locale]
      redirect_to root_path(:locale => params[:set_locale])
    else
      @title = "Welcome to Base Social Network!"
      if signed_in?
        @micropost = Micropost.new
        @feed_items = current_user.feed.paginate(:page => params[:page])
      end
    end
  end

  def about
	@title = "About Base Social Network"
  end

  def help
	@title = "Base Social Network Help"
  end

end
